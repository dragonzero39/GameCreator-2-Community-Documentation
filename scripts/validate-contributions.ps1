# Validates contributions do not leak local paths, Unity artifacts, or large source dumps.
$ErrorActionPreference = "Stop"
$errors = @()
$warnings = @()
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

# --- Banned file extensions anywhere in the repo ---
$bannedExtensions = @(".cs", ".meta", ".unity", ".asset", ".csproj", ".dll", ".pdb", ".sln")
$excludeDirNames = @(".git", ".gitbook", "node_modules")

Get-ChildItem -Path $root -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($root.Length + 1)
    $pathParts = $relative -split '[\\/]'
    if ($excludeDirNames | Where-Object { $pathParts -contains $_ }) { return }

    $ext = $_.Extension.ToLowerInvariant()
    if ($bannedExtensions -contains $ext) {
        $errors += "${relative}: banned file type '$ext' (Unity/GC2 source must stay local)"
    }
}

# --- Patterns that must not appear in text files ---
$absolutePathPatterns = @(
    @{ Name = "Windows absolute path"; Pattern = '[A-Za-z]:\\Users\\' },
    @{ Name = "Windows drive path"; Pattern = '[A-Za-z]:\\(?:[^\\/\s]+\\){2,}' },
    @{ Name = "macOS home path"; Pattern = '/Users/[^/\s]+/' },
    @{ Name = "Linux home path"; Pattern = '/home/[^/\s]+/' },
    @{ Name = "file URL"; Pattern = 'file://' },
    @{ Name = "MSBuild HintPath"; Pattern = '<HintPath>' }
)

# Files allowed to mention paths as negative examples or config templates
$pathCheckExempt = @(
    "CONTRIBUTING.md",
    "local.config.example.json",
    "gc2-docs.code-workspace.example",
    "scripts\validate-contributions.ps1",
    "AGENTS.md"
)

# Content dirs where oversized code blocks are checked
$contentDirs = @("core-functionality", "visual-scripting", "code", "gc2-core-demos")
$maxCodeBlockLines = 100

$textExtensions = @(".md", ".json", ".yaml", ".yml", ".txt")
Get-ChildItem -Path $root -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($root.Length + 1).Replace("\", "/")
    $pathParts = $relative -split '[\\/]'
    if ($excludeDirNames | Where-Object { $pathParts -contains $_ }) { return }
    if ($textExtensions -notcontains $_.Extension.ToLowerInvariant()) { return }

  $normalizedRelative = $relative.Replace("/", "\")
  $isExempt = $pathCheckExempt | Where-Object { $normalizedRelative -eq $_ -or $normalizedRelative -like "*\$_" }

    $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { return }

    if (-not $isExempt) {
        foreach ($rule in $absolutePathPatterns) {
            if ($content -match $rule.Pattern) {
                $errors += "${relative}: contains $($rule.Name)"
            }
        }
    }

    # Block committing local.config.json if it exists and is tracked
    if ($normalizedRelative -eq "local.config.json") {
        $errors += "${relative}: must not be committed (use local.config.example.json)"
    }

    if ($_.Extension -eq ".md" -and -not $isExempt) {
        $inContentArea = $contentDirs | Where-Object { $relative -like "$_/*" -or $relative -eq "$_/README.md" }
        if ($inContentArea) {
            $codeBlocks = [regex]::Matches($content, '(?s)```[^\n]*\n(.*?)```')
            foreach ($block in $codeBlocks) {
                $lineCount = ($block.Groups[1].Value -split "`n").Count
                if ($lineCount -gt $maxCodeBlockLines) {
                    $errors += "${relative}: code block has $lineCount lines (max $maxCodeBlockLines) - avoid pasting proprietary source"
                }
            }
        }
    }
}

# --- Warn if personal workspace file is present ---
if (Test-Path (Join-Path $root "gc2-docs.code-workspace")) {
    $warnings += "gc2-docs.code-workspace exists locally (gitignored) - ensure it is not staged"
}

if ($warnings) {
    Write-Warning ($warnings -join "`n")
}

if ($errors) {
    Write-Error ($errors -join "`n")
    exit 1
}

Write-Output "OK - contribution safety checks passed."
exit 0

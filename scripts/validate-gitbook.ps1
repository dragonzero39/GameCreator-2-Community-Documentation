# Validates GitBook custom block tags are balanced across markdown files.
$errors = @()
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

Get-ChildItem -Path $root -Recurse -Filter "*.md" |
    Where-Object { $_.FullName -notmatch '\\\.git\\' } |
    ForEach-Object {
        $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { return }

        $opens = ([regex]::Matches($content, '\{%\s*(?!end)(\w+)')).Count
        $closes = ([regex]::Matches($content, '\{%\s*end\w+')).Count

        if ($opens -ne $closes) {
            $relative = $_.FullName.Substring($root.Length + 1)
            $errors += "${relative}: block tag mismatch (opens=$opens closes=$closes)"
        }
    }

if ($errors) {
    Write-Error ($errors -join "`n")
    exit 1
}

Write-Output "OK — all markdown files have balanced GitBook block tags."

# GitBook Documentation Skill

Guide for editing this GitBook documentation in Cursor, Claude Code, or other editors via Git Sync.

Official reference (update periodically): https://gitbook.com/docs/creating-content/ai-coding-assistants-and-skillmd

## When to Use

- Git-synced repositories (GitHub, GitLab)
- Local markdown editors, IDE integrations, CLI tools
- Any environment editing GitBook content as files

## Mandatory Workflow

1. Read `SUMMARY.md` first — full TOC and navigation hierarchy
2. If no `SUMMARY.md`, browse directory structure (GitBook infers TOC from folders)
3. Check `.gitbook.yaml` — root path, readme/summary paths, redirects
4. Check `.gitbook/vars.yaml` — space-level variables
5. Check `.gitbook/assets/` — images and uploaded files
6. Make edits; keep `SUMMARY.md` synchronized with file structure
7. Run `scripts/validate-all.ps1` before committing
8. Test rendering in GitBook after push

## File Structure

```
/
  .gitbook/
    assets/       # GitBook-managed images and files
    includes/     # Reusable content blocks
    vars.yaml     # Space-level variables
  .gitbook.yaml
  README.md       # Homepage
  SUMMARY.md      # Table of contents
  section/
    page.md
```

## Block Selection

| Need | Use |
| --- | --- |
| Sequential steps | `{% stepper %}` |
| Language/platform alternatives | `{% tabs %}` |
| Optional detail | `<details>` |
| Warnings/tips | `{% hint style="..." %}` |
| Side-by-side (max 2) | `{% columns %}` |
| Changelog | `{% updates %}` |
| Navigation cards | `<table data-view="cards">` |
| Reusable content | `{% include "/reusable-content/rc12345" %}` |
| Dynamic values | `<code class="expression">space.vars.name</code>` |

## Variable Scope

| Scope | Define in | Access with |
| --- | --- | --- |
| Space-wide | `.gitbook/vars.yaml` | `space.vars.variableName` |
| Page-specific | Frontmatter `vars:` | `page.vars.variableName` |

## Links

- External: `[text](https://example.com)`
- Internal: relative paths `[text](page.md)` or `[text](../folder/page.md)`
- Never reference the same markdown file twice in `SUMMARY.md`

## Key Guardrails

- OpenAPI specs: upload via API/CLI/UI only — never embed in markdown
- Git Sync: manage `README.md` only through the repository
- Close all custom blocks (`{% endtab %}`, `{% endhint %}`, etc.)
- Use spaces (not tabs) for `SUMMARY.md` indentation
- Review AI-generated content in GitBook before merging

---

## Configuration

### .gitbook.yaml

```yaml
root: ./

structure:
  readme: ./README.md
  summary: ./SUMMARY.md

redirects:
  old-page: new-page.md
```

### SUMMARY.md

```markdown
# Summary

## Section group

* [Page title](page.md)
    * [Child page](page/child.md)
* [Another page](other.md "Optional sidebar title")
```

Rules: `#` for title, `##` for groups, `*` with space indentation for nesting, each file once only.

### Page Frontmatter

```markdown
---
description: SEO description
icon: book-open
hidden: true
vars:
  page_variable: value
layout:
  width: default
  tableOfContents:
    visible: true
---
```

### Variables and Expressions

```markdown
<code class="expression">space.vars.latest_version</code>
<code class="expression">page.vars.page_version</code>
```

---

## Custom Blocks

### Tabs

````markdown
{% tabs %}
{% tab title="JavaScript" %}
```javascript
const greeting = 'Hello World';
```
{% endtab %}
{% tab title="Python" %}
```python
greeting = "Hello World"
```
{% endtab %}
{% endtabs %}
````

### Stepper

```markdown
{% stepper %}
{% step %}
## First step
Install dependencies.
{% endstep %}
{% step %}
## Second step
Configure environment variables.
{% endstep %}
{% endstepper %}
```

### Hints

```markdown
{% hint style="info" %}Informational context.{% endhint %}
{% hint style="warning" %}Production caution.{% endhint %}
{% hint style="danger" %}Irreversible action.{% endhint %}
{% hint style="success" %}Success confirmation.{% endhint %}
```

### Expandable

````markdown
<details>
<summary>Advanced Configuration</summary>
Optional detail here.
</details>
````

### Columns (max 2)

```markdown
{% columns %}
{% column %}
### Before
Old approach.
{% endcolumn %}
{% column %}
### After
New approach.
{% endcolumn %}
{% endcolumns %}
```

### Updates (changelog)

```markdown
{% updates format="full" %}
{% update date="2024-01-15" %}
# Version 2.0 Released
New features.
{% endupdate %}
{% endupdates %}
```

### Cards

```markdown
<table data-view="cards">
    <thead>
        <tr>
            <th>Title</th>
            <th data-card-target data-type="content-ref">Target</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Getting Started</td>
            <td><a href="getting-started/quickstart.md">Quick Start</a></td>
        </tr>
    </tbody>
</table>
```

### Buttons

```markdown
<a href="https://example.com" class="button primary">Get Started</a>
<a href="https://github.com/user/repo" class="button primary" data-icon="github">View on GitHub</a>
```

### Content Reference

```markdown
{% content-ref url="target-page.md" %}
target-page.md
{% endcontent-ref %}
```

### Code with Title

````markdown
{% code title="example.cs" %}
```csharp
var x = 1;
```
{% endcode %}
````

---

## Common Pitfalls

- No duplicate files in `SUMMARY.md`
- Keep paths consistent between `SUMMARY.md` and actual file locations
- Manage `README.md` only in Git when Git Sync is enabled
- Always close custom blocks properly
- Test in GitBook after local edits

## Pre-Commit Checklist

- [ ] `SUMMARY.md` reflects new/moved/renamed pages
- [ ] Internal links use correct relative paths
- [ ] Frontmatter is valid YAML
- [ ] Custom blocks are properly opened and closed
- [ ] Variables reference correct scope (`space.vars` vs `page.vars`)
- [ ] No duplicate page entries in `SUMMARY.md`
- [ ] `scripts/validate-all.ps1` passes (GitBook blocks + contribution safety)
- [ ] No `local.config.json`, absolute paths, or Unity/GC2 source files in the commit

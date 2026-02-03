# AGENTS.md

This repository contains Zed editor configuration files for syncing between local installation and git.

## Repository Overview

This is a Zed editor configuration sync repository, not a traditional codebase. It stores editor settings, keybindings, snippets, themes, and extensions.

## Directory Structure

- `config/zed/` - Main Zed configuration files (synced to ~/.config/zed)
  - `settings.json` - Editor settings and preferences
  - `keymap.json` - Custom keybindings
  - `snippets/` - Custom code snippets
  - `themes/` - Custom color themes
- `local/zed/` - Zed local data (synced to ~/.local/share/zed)
  - `extensions/` - Installed extensions and configurations
  - `installed/` - Installed extension data
- `sync_to_repo.sh` - Sync local Zed config to this repository
- `sync_to_client.sh` - Sync repository config to local Zed installation

## Sync Commands

Pull changes from local Zed installation to repo:
```bash
./sync_to_repo.sh
```

Push changes from repo to local Zed installation:
```bash
./sync_to_client.sh
```

## Working with Configuration Files

### JSON Configuration Files

All Zed configuration files use JSON format. When editing:

- Maintain valid JSON syntax (commas, brackets, quotes)
- Use the same structure as existing entries
- Keys should use camelCase (e.g., `buffer_font_size`, `vim_mode`)
- Boolean values: `true`/`false`
- Strings must be double-quoted
- Comments are supported with `//` prefix (Zed strips them before parsing)

### Keymap Format

Keybindings are defined as an array of context objects:
```json
{
  "context": "vim_mode == normal && !Terminal",
  "bindings": {
    "key-combo": "action::Command"
  }
}
```

Common context conditions:
- `vim_mode == normal/insert/visual` - Vim mode state
- `!Terminal` - Not in terminal
- `Editor` - In editor context
- `Workspace` - Workspace level

### Settings Format

Settings use nested objects with dot notation:
```json
{
  "section": {
    "subsection": {
      "key": "value"
    }
  }
}
```

### Snippets Format

Snippets in `config/zed/snippets/`:
```json
{
  "Snippet Name": {
    "prefix": "trigger",
    "body": ["line 1", "line 2"],
    "description": "Optional description"
  }
}
```
Use `$1`, `$2` for tab stops, `$0` for final cursor position.

## Extension Files

Extension configurations are in TOML/SCM/WASM format. Only modify if you understand the extension's configuration schema.

## Shell Scripts

- Scripts use Bash
- Shebang: `#!/bin/bash`
- Use `rsync` for copying files with `-av` flags (archive, verbose)
- No error handling or logging required for this use case

## Testing

There are no automated tests for this repository. Manually verify:
1. Run sync scripts successfully
2. Zed loads configuration correctly
3. Keybindings work as expected
4. Snippets trigger correctly

## Commit Guidelines

When committing changes:
- Sync from local first: `./sync_to_repo.sh`
- Review what changed
- Commit only intended modifications
- Descriptive commit messages (e.g., "Add keybinding for go to definition")

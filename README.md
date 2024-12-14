# Neovim configuration

Setup for everyday text editing and programming.

## Requirements

- [NVIM]() v0.8.0
- [stow](https://www.gnu.org/software/stow/manual/stow.html)

## Installation

The installation script require [stow](https://www.gnu.org/software/stow/manual/stow.html) to be installed on the system.

> Running the script will remove the `$HOME/.config/nvim` directory!

- Run the `ìnstall.sh` script

```shell
./install
```

- Launch Neovim

```shell
nvim
```

- Run the command to install the plugins dependencies.

```vim
:PackerInstall
```

- Verify that all the plugins have been correctly installed:

```vim
:PackerStatus
```

- Verify the Neovim health:

```vim
:CheckHealth
```

## Configuration

The configuration reside in the [`/config/.config/nvim`](config/.config/nvim) directory.
Each plugins has it's own configuration in `lua.eevos.plugins`

## Keybindings

This configuration use the <kbd>space</kbd> key as the leader key. 

### Commenting

You can toggle comment text in normal and visual mode with:

<kbd>leader</kbd> <kbd>/</kbd> 

### Moving text

Move selected line / block of text:

| MODE | KEY | FUNCTION |
|-|-|-
| `normal` / `visual` | <kbd>K</kbd> | Move up | 
| `normal` / `visual` | <kbd>J</kbd> | Move down | 

### Indentation

| MODE | KEY | FUNCTION |
|-|-|-
| `normal` / `visual` | <kbd><</kbd> | Indent left | 
| `normal` / `visual` | <kbd>></kbd> | Indent right | 

### Page up and down

### LSP

Language Server Protocol is used to communicate with the LSP server.

Code source:

| KEY | FUNCTION |
|-|-
| <kbd>g</kbd> <kbd>D</kbd> | Go to declaration | 
| <kbd>g</kbd> <kbd>d</kbd> | Show definition | 
| <kbd>g</kbd> <kbd>i</kbd> | Show implementation |
| <kbd>g</kbd> <kbd>r</kbd> | Show references |
| <kbd>g</kbd> <kbd>t</kbd> | Show type definition |
| <kbd>K</kbd> | Show documentation |
| <kbd>ctrl</kbd> <kbd>k</kbd> | Show signature |
| <kbd>leader</kbd> <kbd>r</kbd> <kbd>n</kbd> | Rename |
| <kbd>leader</kbd> <kbd>c</kbd> <kbd>a</kbd> | Code actions |

Diagnostics:

| KEY | FUNCTION |
|-|-
| <kbd>]</kbd> <kbd>d</kbd> | Go to next diagnostic | 
| <kbd>[</kbd> <kbd>d</kbd> | Go to previous diagnostic | 
| <kbd>g</kbd> <kbd>l</kbd> | Show line diagnostics |
| <kbd>leader</kbd> <kbd>q</kbd> | Show quickfix |
| <kbd>leader</kbd> <kbd>f</kbd> | Show floating diagnostics |

Workspace:

| KEY | FUNCTION |
|-|-
| <kbd>leader</kbd> <kbd>w</kbd> <kbd>a</kbd> | Add workspace |
| <kbd>leader</kbd> <kbd>w</kbd> <kbd>r</kbd> | Remove workspace |
| <kbd>leader</kbd> <kbd>w</kbd> <kbd>l</kbd> | List workspace folders |

### Git Signs

Git signs is used to show git status in the gutter and in the status line. It
allows you to manipulate hunks of changes.

| MODE | KEY | FUNCTION |
|-|-|-
| `normal` | <kbd>]</kbd> <kbd>c</kbd> | Next Hunk | 
| `normal` | <kbd>[</kbd> <kbd>c</kbd> | Previous Hunk | 
| `normal` | <kbd>leader</kbd> <kbd>t</kbd> <kbd>b</kbd> | Toggle blame |
| `visual` | <kbd>leader</kbd> <kbd>hs</kbd> | Hunk stage |
| `visual` | <kbd>leader</kbd> <kbd>hr</kbd> | Hunk reset |

### Tree File System Explorer

| K | A | UA
|-|-|-
| `<C-]>`|          CD                         |nvim-tree-api.tree hange_root_to_node()|
| `<C-e>`|          Open: In Place             |nvim-tree-api.node.open.replace_tree_buffer()|
| `<C-k>`|          Info                       |nvim-tree-api.node.show_info_popup()|
| `<C-r>`|          Rename: Omit Filename      |nvim-tree-api.fs.rename_sub()|
| `<C-t>`|          Open: New Tab              |nvim-tree-api.node.open.tab()|
| `<C-v>`|          Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
| `<C-x>`|          Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()|
| `<BS>` |          Close Directory            |nvim-tree-api.node.navigate.parent_close()|
| `<CR>` |          Open                       |nvim-tree-api.node.open.edit()|
| `<Tab>`|          Open Preview               |nvim-tree-api.node.open.preview()|
| `>`|              Next Sibling               |nvim-tree-api.node.navigate.sibling.next()|
| `<`|              Previous Sibling           |nvim-tree-api.node.navigate.sibling.prev()|
| `.`|              Run Command                |nvim-tree-api.node.run.cmd()|
| `-`|              Up                         |nvim-tree-api.tree.change_root_to_parent()|
| `a`|              Create                     |nvim-tree-api.fs.create()|
| `bd`|             Delete Bookmarked          |nvim-tree-api.marks.bulk.delete()|
| `bt`|             Trash Bookmarked           |nvim-tree-api.marks.bulk.trash()|
| `bmv`|            Move Bookmarked            |nvim-tree-api.marks.bulk.move()|
| `B`|              Toggle Filter: No Buffer   |nvim-tree-api.tree.toggle_no_buffer_filter()|
| `c`|              Copy                       |nvim-tree-api.fs.copy.node()|
| `C`|              Toggle Filter: Git Clean   |nvim-tree-api.tree.toggle_git_clean_filter()|
| `[c`|             Prev Git                   |nvim-tree-api.node.navigate.git.prev()|
| `]c` |         Next Git                   |nvim-tree-api.node.navigate.git.next()|
| `d`  |         Delete                     |nvim-tree-api.fs.remove()|
| `D`  |         Trash                      |nvim-tree-api.fs.trash()|
| `E`  |         Expand All                 |nvim-tree-api.tree.expand_all()|
| `e`  |         Rename: Basename           |nvim-tree-api.fs.rename_basename()|
| `]e` |         Next Diagnostic            |nvim-tree-api.node.navigate.diagnostics.next()|
| `[e` |         Prev Diagnostic            |nvim-tree-api.node.navigate.diagnostics.prev()|
| `F`  |         Clean Filter               |nvim-tree-api.live_filter.clear()|
| `f`  |         Filter                     |nvim-tree-api.live_filter.start()|
| `g?` |         Help                       |nvim-tree-api.tree.toggle_help()|
| `gy` |          Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|
| `H`|              Toggle Filter: Dotfiles    |nvim-tree-api.tree.toggle_hidden_filter()|
| `I`|              Toggle Filter: Git Ignore  |nvim-tree-api.tree.toggle_gitignore_filter()|
| `J`|              Last Sibling               |nvim-tree-api.node.navigate.sibling.last()|
| `K`|              First Sibling              |nvim-tree-api.node.navigate.sibling.first()|
| `m`|              Toggle Bookmark            |nvim-tree-api.marks.toggle()|
| `o`|              Open                       |nvim-tree-api.node.open.edit()|
| `O`|              Open: No Window Picker     |nvim-tree-api.node.open.no_window_picker()|
| `p`|              Paste                      |nvim-tree-api.fs.paste()|
| `P`|              Parent Directory           |nvim-tree-api.node.navigate.parent()|
| `q`|              Close                      |nvim-tree-api.tree.close()|
| `r`|              Rename                     |nvim-tree-api.fs.rename()|
| `R`|              Refresh                    |nvim-tree-api.tree.reload()|
| `s`|              Run System                 |nvim-tree-api.node.run.system()|
| `S`|              Search                     |nvim-tree-api.tree.search_node()|
| `u`|              Rename: Full Path          |nvim-tree-api.fs.rename_full()|
| `U`|              Toggle Filter: Hidden      |nvim-tree-api.tree.toggle_custom_filter()|
| `W`|              Collapse                   |nvim-tree-api.tree.collapse_all()|
| `x`|              Cut                        |nvim-tree-api.fs.cut()|
| `y`|              Copy Name                  |nvim-tree-api.fs.copy.filename()|
| `Y`|              Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|
| `<2-Left Mouse>`  | Open                       |nvim-tree-api.node.open.edit()|
| `<2-Righ tMouse>` | CD | nvim-tree-api.tree.change_root_to_node()|

## References

- <https://neovim.io/doc/>

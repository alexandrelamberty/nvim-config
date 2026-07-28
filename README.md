# Neovim configuration

Personal Neovim setup tuned for everyday text editing, TypeScript/Rust/Python
development, and writing markdown notes. Everything is written in Lua and
organized into feature-focused modules under `lua/eevos`.

## Highlights

- Ergonomic UX tweaks: which-key, autopairs, quickfix enhancements, and a modern
Material theme powered by Heirline.
- Full LSP, DAP, and Treesitter stack with language-specific tweaks under
`lua/eevos/lsp` and `lua/eevos/dap`.
- Git-aware workflow via gitsigns and Neogit plus Telescope pickers for npm
scripts and files.
- Multiple markdown rendering options: `markdown-preview`, `render-markdown`,
    and a minimal `nvim-markdown-preview` command line previewer.

## Requirements

- Neovim **v0.9+** (0.10 recommended for `:h cmdheight=0`)
    - [git](https://git-scm.com/) and `curl` for bootstrapping plugins
    - [GNU Stow](https://www.gnu.org/software/stow/) for installing the dotfiles

    > Earlier versions (0.6) technically work, but some UI settings such as
    > `laststatus=3` and `cmdheight=0` behave best on current releases.

## Installation

    1. Inspect the installer options and run it with Stow:

    ```sh
    ./install.sh --dry-run   # preview changes
    ./install.sh             # deploy files into ~/.config/nvim
    ```

    2. Launch Neovim and fetch plugins:

    ```vim
    :PackerSync
    ```

    3. Restart Neovim so that compiled plugin code is picked up.

## Project layout

    ```
    config/
    ├── .config/nvim/
    │   ├── init.lua             # bootstrapper that loads every module safely
    │   ├── lua/eevos/           # all Lua configuration lives here
    │   │   ├── plugins.lua      # packer.nvim specification
    │   │   ├── settings.lua     # core options / globals
│   │   ├── lsp/             # language servers configs (per language file)
    │   │   ├── dap/             # debug adapter configs
    │   │   └── plugins/*.lua    # per-plugin setup modules
                         │   └── after/, plugin/, ... # filetype tweaks & user snippets
                         ├── install.sh               # GNU Stow helper
                         └── README.md
                         ```

                         Use this map when trying to track down where an option or keymap is defined.
                         Almost every component has its own small Lua file, so you rarely have to dig
                         through a huge monolithic config.

## Common tasks

- `:PackerSync` – install or update plugins.
- `:PackerStatus` – quickly evaluate plugin health.
- `:checkhealth` – confirm Neovim providers (node, python, etc.) are set up.
- `:LspInstall <server>` – install servers defined in `lua/eevos/lsp`.
- `:DapContinue` / `<F5>` – kick off debugging sessions (see `lua/eevos/dap`).

## Plugins in use

| Area              | Plugins                                                                                                |
| ----------------- | ------------------------------------------------------------------------------------------------------ |
| Core / UX         | packer.nvim, plenary.nvim, popup.nvim, which-key.nvim, nvim-bqf, zen-mode.nvim                         |
| Editing           | nvim-autopairs, nvim-comment, LuaSnip, cmp buffer/path/cmdline/nvim-lsp/nvim-lua                       |
| LSP / Diagnostics | nvim-lspconfig, nvim-lsp-installer, lspsaga.nvim, null-ls.nvim, lspkind-nvim                           |
| Git               | gitsigns.nvim, neogit                                                                                  |
| UI                | material.nvim, heirline.nvim, nvim-web-devicons                                                        |
| Treesitter        | nvim-treesitter, nvim-ts-autotag                                                                       |
| Telescope         | telescope.nvim, telescope-js-package-scripts.nvim                                                      |
| Markdown          | markdown-preview.nvim, MeanderingProgrammer/render-markdown.nvim, davidgranstrom/nvim-markdown-preview |
| Files / Terminal  | nvim-tree.lua, rnvimr, toggleterm.nvim, vim-floaterm                                                   |
| Debugging         | nvim-dap, nvim-dap-ui                                                                                  |

Feel free to trim or add plugins at will—`lua/eevos/plugins.lua` is grouped by
feature and annotated so it is easier to maintain going forward.

## Troubleshooting

- Packer errors on startup: delete `~/.local/share/nvim/site/pack/packer` and
relaunch Neovim; the bootstrapper will clone a fresh copy automatically.
- LSP server missing: run `:LspInstall <server>` and then restart Neovim.
- Markdown preview does not open: ensure you ran `:PackerSync` so the
`mkdp#util#install()` step compiled the Node dependency.

Happy editing!

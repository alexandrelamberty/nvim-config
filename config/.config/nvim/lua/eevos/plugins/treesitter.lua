-- Nvim Tree sitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {
    "haskell"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {
      "yaml",
      "python",
      "html",
      "javascript"
    }
  },
  -- TODO seems to be broken
  -- indent = {enable = {"javascriptreact"}},
  autotag = {
    enable = true
  }
}

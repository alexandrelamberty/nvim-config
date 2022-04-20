-- https://github.com/jose-elias-alvarez/null-ls.nvim
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- Builtins (code_action, completion, diagnostics, formatting, hover)

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/completion/
local completion = null_ls.builtins.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
local hover = null_ls.builtins.hover

null_ls.setup {
  debug = false,
  sources = {
    completion.spell,
    code_actions.gitsigns,
    code_actions.eslint,
    diagnostics.eslint,
    formatting.prettier.with {
      extra_args = {
        "--no-semi",
        "--single-quote",
        "--jsx-single-quote"
      }
    },
    formatting.black.with {
      extra_args = {
        "--fast"
      }
    },
    -- formatting.yapf,
    formatting.lua_format,
    formatting.shfmt.with {
      formatCommand = 'shfmt -ci -s -bn',
      formatStdin = true
    },
    diagnostics.shellcheck.with {
      lintCommand = 'shellcheck -f gcc -x',
      lintFormats = {
        '%f:%l:%c: %trror: %m',
        '%f:%l:%c: %tarning: %m',
        '%f:%l:%c: %tote: %m'
      }

    },
    diagnostics.flake8
    -- completion.spell
  }
}

--- Diagnostic 
-- @module diagnostic
-- @see https://neovim.io/doc/user/diagnostic.html
-- @see https://neovim.io/doc/user/lsp.html#lsp-diagnostic

-- define signs used by diagnostic
-- @see https://neovim.io/doc/user/diagnostic.html#diagnostic-signs
local signs = {
	{
		name = "DiagnosticSignError",
		text = ""
	},
	{
		name = "DiagnosticSignWarn",
		text = ""
	},
	{
		name = "DiagnosticSignInfo",
		text = ""
	},
	{
		name = "DiagnosticSignHint",
		text = ""
	}
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {
		texthl = sign.name,
		text = sign.text,
		numhl = sign.name
	})
end

-- diagnostic config
-- @see https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
local config = {
	virtual_text = true, 
	signs = {
		active = signs
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "none",
		source = "always",
		header = "diagnostic",
		prefix = ""
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
}

vim.diagnostic.config(config)

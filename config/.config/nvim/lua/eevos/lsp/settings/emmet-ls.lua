-- emmetls LSP configuration

local opts = {
	default_config = {
		cmd = {
			'emmet-ls',
			'--stdio'
		},
		filetypes = {
			'html',
			'css'
		},
		root_dir = function()
			return vim.loop.cwd()
		end,
		settings = {}
	}
}

return opts

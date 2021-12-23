local execute = vim.api.nvim_command
local fn = vim.fn

-- Install if is not present
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
	local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"
	local plugin_path = plugin_prefix .. plugin .. "/"
	--	print('test '..plugin_path)
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	--	print(ok, err, code)
	if ok then
		vim.cmd("packadd " .. plugin)
	end
	return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
	function(use)
		use "wbthomason/packer.nvim"
		use {"nvim-lua/popup.nvim", opt = true}
		use {"nvim-lua/plenary.nvim", opt = true}
		--- LSP
		use {"neovim/nvim-lspconfig", opt = true}
		use {'williamboman/nvim-lsp-installer', opt = true}
		use {"glepnir/lspsaga.nvim", opt = true}
		-- Telescope
		use {"nvim-telescope/telescope.nvim", opt = true}
		-- Debugging
		use {"mfussenegger/nvim-dap", opt = true}
		-- Autocomplete
		use {"hrsh7th/nvim-compe", opt = true}
		use {"hrsh7th/vim-vsnip", opt = true}
		use {"rafamadriz/friendly-snippets", opt = true}
		-- Treesitter
		use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
		use {"windwp/nvim-ts-autotag", opt = true}
		-- Explorer
		use "kyazdani42/nvim-tree.lua"
		use "kevinhwang91/rnvimr"
		-- Utils
		use {"windwp/nvim-autopairs", opt = true}
		use {"terrortylor/nvim-comment", opt = true}
		use {"kevinhwang91/nvim-bqf", opt = true}
		-- Themes & Icons
		use {"kaicataldo/material.vim", opt = true}
		use {"kyazdani42/nvim-web-devicons", opt = true}
		use {"ChristianChiarulli/dashboard-nvim", opt = true}
		use {"lewis6991/gitsigns.nvim", opt = true}
		use {"glepnir/galaxyline.nvim", opt = true}
		use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
		use {"liuchengxu/vim-which-key", opt = true}

		-- TODO replace by pcall
		require_plugin("nvim-lspconfig")
		require_plugin("nvim-lsp-installer")
		require_plugin("lspsaga.nvim")
		require_plugin("nvim-lspinstall")
		require_plugin("popup.nvim")
		require_plugin("plenary.nvim")
		require_plugin("telescope.nvim")
		require_plugin("nvim-dap")
		require_plugin("nvim-compe")
		require_plugin("vim-vsnip")
		require_plugin("nvim-treesitter")
		require_plugin("nvim-ts-autotag")
		require_plugin("nvim-tree.lua")
		require_plugin("gitsigns.nvim")
		require_plugin("vim-which-key")
		require_plugin("dashboard-nvim")
		require_plugin("nvim-autopairs")
		require_plugin("nvim-comment")
		require_plugin("nvim-bqf")
		require_plugin("nvcode-color-schemes.vim")
		require_plugin("nvim-web-devicons")
		require_plugin("galaxyline.nvim")
		require_plugin("neogit")
	end
)

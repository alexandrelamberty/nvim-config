-- LSP module
-- @module lsp

local M = {}

-- Set up LSP handlers configuration. Theses can be overwritten in the LSP configurations.
M.setup = function()
	-- https://neovim.io/doc/user/lsp.html#lsp-api

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover, {
			-- border = "single",
			border = "none",
			title = "hover"
		})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help, {
			border = "none"
		})

	-- see: eevos.diagnostic.diagnostic	
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
			vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics,
				{
					virtual_text = true,
					border = "none"
				}
			)

	local on_references = vim.lsp.handlers["textDocument/references"]
	vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
		on_references, {
			-- Use location list instead of quickfix list
			loclist = false,
		}
	)
end

-- Set autocommands conditional on server_capabilities
-- https://neovim.io/doc/user/lsp.html#lsp-highlight
local function lsp_highlight_document(client)
	if client.server_capabilities.documentHighlightProvider then
		-- FIXME: find references for theses highlights
		vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=235 guibg=none
      hi! LspReferenceText cterm=bold ctermbg=235 guibg=none
      hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=non
      hi! LspInlayHint cterm=bold ctermbg=235 guibg=blue
    ]]
		vim.api.nvim_create_augroup('lsp_document_highlight', {})
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.clear_references,
		})
		--
		vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
	end
end

-- Set keybindings
local function lsp_keymaps(bufnr)
	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

	-- Buffer
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Show definition" })
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Show implementation" })
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references" })
	map('n', 'gt', vim.lsp.buf.type_definition, { desc = "Show type definition" })

	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show documentation" })
	map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature" })

	map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
	map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })

	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	-- Diagnostic
	map("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	opts.desc = "Show line diagnostics"
	map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	opts.desc = "Go to previous diagnostic"
	map("n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	opts.desc = "Go to next diagnostic"
	map("n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	opts.desc = "Show diagnostic list"
	map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		-- local ts_utils = require("nvim-lsp-ts-utils")
		-- ts_utils.setup({})
		-- ts_utils.setup_client(client)
		-- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
		-- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
		-- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	-- lsp_diagnostic(client)
end

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M

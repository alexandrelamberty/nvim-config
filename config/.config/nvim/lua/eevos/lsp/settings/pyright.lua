-- pyright
return {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off"
			}
		}
	}
}

local defaults = require("lsp.providers.default")
require("lspconfig").pyright.setup({
	on_attach = function(client, bufnr)
		defaults.on_attach(client, bufnr)
	end,
})

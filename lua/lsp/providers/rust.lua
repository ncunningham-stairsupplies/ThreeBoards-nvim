local defaults = require("lsp.providers.default")
require("lspconfig").rls.setup({
	on_attach = function(client, bufnr)
		defaults.on_attach(client, bufnr)
	end,
})
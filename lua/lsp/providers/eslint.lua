local on_attach = require("lsp.providers.default").on_attach
require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
})

local on_attach = require("lsp.providers.default").on_attach
-- https://github.com/golang/tools/tree/master/gopls
-- go install golang.org/x/tools/gopls@latest
require("lspconfig").gopls.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
})

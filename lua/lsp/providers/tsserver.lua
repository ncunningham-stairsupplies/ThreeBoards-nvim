local defaults = require("lsp.providers.default")
-- sh
-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		defaults.on_attach(client, bufnr)
	end,
	handlers = defaults.handlers,
})

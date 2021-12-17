local defaults = require("lsp.providers.default")
-- sh
-- npm i -g vscode-langservers-extracted
require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		defaults.on_attach(client, bufnr)
	end,
	capabilities = defaults.capabilities,
})

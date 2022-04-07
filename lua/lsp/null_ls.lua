local null_ls = require("null-ls")
-- npm install -g @fsouza/prettierd
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.gofmt,
	},
	on_attach = require('lsp.handlers').on_attach,
})

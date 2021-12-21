require("lsp.providers.tsserver")
require("lsp.providers.null_ls")
require("lsp.providers.eslint")
require("lsp.providers.gopls")
require("lsp.providers.sumneko")

local installed, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installed then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {}

	server:ready(opts)
end)

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

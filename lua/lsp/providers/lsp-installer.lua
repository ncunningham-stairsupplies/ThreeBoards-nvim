local installed, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installed then
	return
end

local default_config = {}

lsp_installer.on_server_ready(function(server)
	local opts = default_config

	if server.name == "tsserver" then
		opts = vim.tbl_deep_extend("force", opts, require("lsp.providers.tsserver"))
	end

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

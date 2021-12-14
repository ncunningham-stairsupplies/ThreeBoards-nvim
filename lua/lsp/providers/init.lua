local lsp_installer = require("nvim-lsp-installer")
local default_config = require("lsp.providers.default")


lsp_installer.on_server_ready(function(server)
	local opts = default_config
	opts.autostart=true

	if server.name == 'tsserver' then
		opts = vim.tbl_deep_extend('force', opts, require('lsp.providers.tsserver'))
	end
	server:setup(opts)
end)

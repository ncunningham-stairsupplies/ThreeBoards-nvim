local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
	return
end
local servers = {
  "bashls",
	"gopls",
	"graphql",
	"sumneko_lua",
	"tsserver",
	"tailwindcss",
	"jsonls",
	"eslint",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {}
	opts.on_attach = require("lsp.handlers").on_attach
	opts.capabilities = require("lsp.handlers").capabilities

    server:setup(opts)
end)

require("lsp.handlers").setup()
require('lsp.null_ls')

require("plugins.DAPInstall.mappings")

local ok, DAPInstall = pcall(require, "DAPInstall")
if not ok then
	return
end

DAPInstall.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

local plugins = {
	"nvim-tree",
	"treesitter",
	"telescope",
	"nvim-cmp",
	"auto-pairs",
	"comment",
	"lualine",
	"which-key",
	"dadbod",
	"gitsigns",
	"lightspeed",
	"lsp_signature",
	"neoscroll",
	"aerial",
	"fugitive",
	"nvim-dap",
	"nvim-dap-ui",
	"nvim-dap-virtual-text",
	"DAPInstall",
	"telescope-dap",
}

for _, plugin in ipairs(plugins) do
	pcall(require, "plugins/" .. plugin)
end

return plugins

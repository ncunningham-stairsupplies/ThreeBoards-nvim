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
	"lspsaga",
}

for _, plugin in ipairs(plugins) do
	pcall(require, "plugins/" .. plugin)
end

return plugins

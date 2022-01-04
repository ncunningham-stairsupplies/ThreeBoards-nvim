require("plugins.aerial.mappings")

local ok, aerial = pcall(require, "aerial")
if not ok then
	return
end

require("telescope").load_extension("aerial")

aerial.setup({})

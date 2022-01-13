require("plugins.instant.mappings")

local ok, instant = pcall(require, "instant")
if not ok then
	return
end

instant.setup({})

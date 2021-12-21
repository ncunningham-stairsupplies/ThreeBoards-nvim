local pairs_installed, pairs = pcall(require, "nvim-autopairs")
if not pairs_installed then
	return
end
pairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

local cmpPairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmpPairs_ok then
	return
end

local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

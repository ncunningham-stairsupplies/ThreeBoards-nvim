local ok, neoscroll = pcall(require, "neoscroll")
if not ok then
	return
end

neoscroll.setup({
	easing_function = "quadratic"
})

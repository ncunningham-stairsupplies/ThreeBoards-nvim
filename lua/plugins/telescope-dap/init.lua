require("plugins.telescope-dap.mappings")

local ok, telescope_dap = pcall(require, "telescope-dap")
if not ok then
	return
end

telescope_dap.setup({})

require("telescope").load_extension("dap")

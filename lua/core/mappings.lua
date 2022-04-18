local utils = require("utils")
local map = utils.map
local extend_merge = utils.tbl_extend_merge
local user_mappings = require("user.mappings")
local lsp = require("lsp.mappings")

local plugins = require("plugins")

local core_mappings = {
	lsp = lsp,
}

local function copy(lines, _)
  vim.fn.OSCYankString(table.concat(lines, "\n"))
end

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(''), '\n'),
    vim.fn.getregtype('')
  }
end

vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = copy,
    ["*"] = copy
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste
  }
}

local plugin_mappings = {}
-- load all plugin mappings that are defined
for _, plugin_name in ipairs(plugins) do
	-- get mappings file
	local ok, plug_map = pcall(require, "plugins." .. plugin_name .. ".mappings")

	-- if exists, check for mappings table and add
	if ok then
		if type(plug_map) == "table" then
			plugin_mappings[plugin_name] = plug_map
		end
	end
end

extend_merge(core_mappings, plugin_mappings, { "mode", "keybind", "command" })

local mappings = extend_merge(core_mappings, user_mappings, { "mode", "keybind", "command" })

for _, group in pairs(mappings) do
	for _, binding in pairs(group) do
		map(binding.mode, binding.keybind, binding.command)
	end
end

return mappings

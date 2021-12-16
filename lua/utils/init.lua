local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	--	print(mode, lhs, rhs)
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.tbl_extend_merge(left, right)
	local newTable = left

	--merge
	for groupName, group in pairs(left) do
		for bindingName, binding in pairs(group) do
			if right[groupName] then
				if right[groupName][bindingName] then
					local leftKeys = vim.tbl_keys(binding)
					local rightKeys = vim.tbl_keys(right[groupName][bindingName])

					for keyName, key in pairs(leftKeys) do
						if right[groupName][bindingName][key] ~= nil then
							newTable[groupName][bindingName][key] = right[groupName][bindingName][key]
						end
					end
				end
			end
		end
	end
	--extend
	for groupName, group in pairs(right) do
		for bindingName, binding in pairs(group) do
			if left[groupName] then
				if right[groupName][bindingName] then
					local leftKeys = vim.tbl_keys(binding)
					local rightKeys = vim.tbl_keys(right[groupName][bindingName])

					for keyName, key in pairs(leftKeys) do
						if right[groupName][bindingName][key] ~= nil then
							newTable[groupName][bindingName][key] = right[groupName][bindingName][key]
						end
					end
				end
			end
		end
	end

	return newTable
end

return M

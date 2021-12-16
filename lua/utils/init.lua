local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	print(mode, lhs, rhs)
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.tbl_extend_merge(left, right, extend_required_keys)
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
		-- Just copy over the right side group if it doesn't exist already
		if left[groupName] == nil then
			newTable[groupName] = right[groupName]
		else
			-- Loop through bindings to see if any need to be added
			for bindingName, binding in pairs(group) do
				if left[groupName][bindingName] == nil then
					local goodBind = true
					print(vim.inspect(extend_required_keys))
					for _, v in pairs(extend_required_keys) do
						print(v)
						print(right[groupName][bindingName][v])
						if right[groupName][bindingName][v] == nil then
							goodBind = false
						end
					end

					if goodBind then
						--newTable[groupName][bindingName] = right[groupName][bindingName]
					else
						vim.notify("Error In Keybinding: " .. vim.inspect(right[groupName][bindingName]))
					end
				end
			end
		end
	end

	return newTable
end

return M

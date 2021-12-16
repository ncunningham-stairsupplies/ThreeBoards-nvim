local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.isGoodBinding(extend_required_keys, binding)
	local goodBind = true
	for _, v in pairs(extend_required_keys) do
		if binding[v] == nil then
			goodBind = false
		end
	end
	return goodBind
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
			local goodGroup = true
			for bindingName, binding in pairs(group) do
				local goodBind = M.isGoodBinding(extend_required_keys, binding)
				if goodBind == false then
					goodGroup = false
				end
			end
			if goodGroup == true then
				newTable[groupName] = right[groupName]
			else
				vim.notify("Keybinding Error. Keys Missing In " .. groupName .. "--" .. bindingName)
			end
		else
			-- Loop through bindings to see if any need to be added
			for bindingName, binding in pairs(group) do
				if left[groupName][bindingName] == nil then
					local goodBind = M.isGoodBinding(extend_required_keys, binding)
					if goodBind then
						newTable[groupName][bindingName] = right[groupName][bindingName]
					else
						vim.notify("Keybinding Error. Keys Missing In " .. groupName .. "--" .. bindingName, 1)
					end
				end
			end
		end
	end

	return newTable
end

return M

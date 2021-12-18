local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.is_good_binding(extend_required_keys, binding)
	for _, v in pairs(extend_required_keys) do
		if binding[v] == nil then
			return false
		end
	end
	return true
end

function M.tbl_extend_merge(left, right, extend_required_keys)
	for groupName, group in pairs(right) do
		-- Check to see if the group exists in left
		if left[groupName] ~= nil then
			-- If it does, check the bindings
			for bindingName, binding in pairs(group) do
				-- Check if it exists
				if left[groupName][bindingName] ~= nil then
					-- If it exists, merge the overwritten keys
					for k, v in pairs(binding) do
						left[groupName][bindingName][k] = v
					end
				else
					-- If it doesn't exist, make sure it's good
					if M.is_good_binding(extend_required_keys, binding) then
						-- If it's good, add it
						left[groupName][bindingName] = binding
					else
						-- Throw an error
						vim.notify("Keybinding Error. Keys Missing In " .. groupName .. "--" .. bindingName, 1)
					end
				end
			end
			-- If the group doesn't exist...
		else
			-- Add the group
			left[groupName] = {}
			-- Loop thrugh the bindings and add any good ones
			for bindingName, binding in pairs(group) do
				if M.is_good_binding(extend_required_keys, binding) then
					left[groupName][bindingName] = binding
				else
					vim.notify("Keybinding Error. Keys Missing In " .. groupName .. "--" .. bindingName, 1)
				end
			end
		end
	end
	return left
end

return M

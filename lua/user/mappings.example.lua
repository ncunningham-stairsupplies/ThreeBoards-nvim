local map = require("utils").map

-- Any keymap that has been set as a default can be overwritten by changing the keybind in the user_mappings table
-- additional keybinds can be added by using the following structure in any of the existing groups or by creating your own group
-- "name" = {
-- }

local user_mappings = {
	lsp = {
		declaration = {
			keybind = "gD",
		},
		definition = {
			keybind = "gd",
		},
		implementation = {
			keybind = "gi",
		},
		get_references = {
			keybind = "gr",
		},
		hover = {
			keybind = "K",
		},
		signature_help = {
			keybind = "<C-k>",
		},
		format = {
			keybind = "<leader>la",
		},
		code_action = {
			keybind = "<leader>la",
		},
		diagnostics_window = {
			keybind = "<leader>ld",
		},
		type_definition = {
			keybind = "<leader>D",
		},
		rename = {
			keybind = "<leader>rn",
		},
		diagnostic_prev = {
			keybind = "[d",
		},
		diagnostic_next = {
			keybind = "]d",
		},
	},
	nvim_tree = {},
	telescope = {},
}

return user_mappings

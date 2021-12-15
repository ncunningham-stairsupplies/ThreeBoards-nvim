local map = require("utils").map

map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

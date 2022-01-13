local map = require("utils").map

map("n", "<leader>is", ":InstantStartServer<CR>")
map("n", "<leader>iS", ":InstantStopServer<CR>")
map("n", "<leader>ijs", ":InstantStartSession 0.0.0.0<CR>")
map("n", "<leader>ijS", ":InstantJoinSession 0.0.0.0<CR>")
map("n", "<leader>ijx", ":InstantJoinStop")

local map = require("utils").map

map("n", "<leader>is", ":InstantStartServer<CR>")
map("n", "<leader>iS", ":InstantStopServer<CR>")
map("n", "<leader>ijs", ":InstantStartSession localhost 8080<CR>")
map("n", "<leader>ijS", ":InstantJoinSession localhost 8080<CR>")
map("n", "<leader>ijx", ":InstantJoinStop")

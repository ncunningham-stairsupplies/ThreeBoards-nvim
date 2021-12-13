local map = require('utils').map

map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>')

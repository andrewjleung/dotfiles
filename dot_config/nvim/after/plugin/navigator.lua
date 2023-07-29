local navigator = require('Navigator')

vim.keymap.set("n", "<C-h>", navigator.left)
vim.keymap.set("n", "<C-j>", navigator.down)
vim.keymap.set("n", "<C-k>", navigator.up)
vim.keymap.set("n", "<C-l>", navigator.right)

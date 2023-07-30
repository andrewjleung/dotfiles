local fzf = require('fzf-lua')

vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fg", fzf.grep)
vim.keymap.set("n", "<leader>fG", fzf.grep_last)


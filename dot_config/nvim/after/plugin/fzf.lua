local fzf = require('fzf-lua')

vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fg", ":FzfLua grep<CR><CR>")
vim.keymap.set("n", "<leader>fG", ":FzfLua grep_last<CR>")

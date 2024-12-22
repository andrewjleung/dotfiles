vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>lua require('fzf-lua').live_grep_native()<CR>", { silent = true })
vim.keymap.set("n", "<leader>ll", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", { silent = true })

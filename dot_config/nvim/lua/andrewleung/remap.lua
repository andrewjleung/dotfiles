vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- move selections up and down with `J` and `K`
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keep cursor centered when doing half page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centered when searching for terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste while preserving what's in the copy register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- copy to the system clipboard with `<leader>y`
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- find and replace the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Show all diagnostics on current line in floating window
vim.keymap.set(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.keymap.set(
  'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.keymap.set(
  'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

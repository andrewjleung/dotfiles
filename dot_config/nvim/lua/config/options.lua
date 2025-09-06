-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.clipboard = ""

vim.filetype.add({
  extension = {
    typ = "typst",
    keymap = "dts",
  },
})

vim.lsp.enable("shopify_theme_ls")
vim.lsp.config("shopify_theme_ls", {
  root_markers = {
    ".trmnlp.yml",
  },
})

vim.lsp.enable("bashls")
vim.lsp.config("bashls", {
  filetypes = { "zsh" },
})

vim.lsp.enable("buf_ls")

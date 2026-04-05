local gh = require('utils').gh

vim.pack.add {
  gh 'oskarnurm/koda.nvim',
}

vim.pack.add {}
require('koda').setup { transparent = true }
vim.cmd 'colorscheme koda'

local gh = require('utils').gh

vim.pack.add { gh 'saecki/crates.nvim' }

require('crates').setup()

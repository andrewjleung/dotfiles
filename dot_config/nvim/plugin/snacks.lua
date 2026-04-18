local gh = require('utils').gh

vim.pack.add({
    gh('folke/snacks.nvim'),
})

require('snacks').setup({
    statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
        refresh = 50, -- refresh at most every 50ms
    },
})

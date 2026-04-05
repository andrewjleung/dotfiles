local gh = require('utils').gh
local map = require('utils').map
local on_install_or_update = require('utils').on_install_or_update

-- Fuzzy Finder (fff)
--
vim.pack.add { gh 'dmtrKovalenko/fff.nvim' }

on_install_or_update('fff.nvim', function(event)
  vim.notify('fff.nvim: downloading/building binary', vim.log.levels.INFO)
  require('fff.download').download_or_build_binary()
end)

-- the plugin will automatically lazy load
vim.g.fff = {
  lazy_sync = true, -- start syncing only when the picker is open
  debug = {
    enabled = true,
    show_scores = true,
  },
}

map('n', '<leader>ff', function() require('fff').find_files() end, { desc = '[f]ind [f]iles' })
map('n', '<leader>/', function() require('fff').live_grep() end, { desc = 'Live grep' })
map('n', '<leader>fg', function() require('fff').live_grep() end, { desc = 'Live grep' })
map('n', '<leader>fz', function() require('fff').live_grep { grep = { modes = { 'fuzzy', 'plain' } } } end, { desc = 'Live fuzzy grep' })

-- File Explorer (Yazi)

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'mikavilpas/yazi.nvim',
}

map('n', '<leader>yy', function() require('yazi').yazi() end, { desc = 'Open yazi at current file' })
map('v', '<leader>yy', function() require('yazi').yazi() end, { desc = 'Open yazi at current file' })

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    require('yazi').setup {
      open_for_directories = true,
      keymaps = {
        show_help = '<f1>',
      },
    }
  end,
})

-- Flash

vim.pack.add {
  gh 'folke/flash.nvim',
}

local flash = require 'flash'
flash.setup()

map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
map('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
map({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
map({ 'c' }, '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })

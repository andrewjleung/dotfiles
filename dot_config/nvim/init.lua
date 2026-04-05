require 'options'
require 'autocommands'

local gh = require('utils').gh
local on_install_or_update = require('utils').on_install_or_update

on_install_or_update('nvim-treesitter', function(event)
  if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
  vim.cmd 'TSUpdate'
end)

vim.pack.add {
  gh 'NMAC427/guess-indent.nvim',
  gh 'lewis6991/gitsigns.nvim',
  gh 'folke/which-key.nvim',
  gh 'folke/todo-comments.nvim',
  gh 'nvim-mini/mini.nvim',
  gh 'kylechui/nvim-surround',
}

require('guess-indent').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
}

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange' })

    -- Actions
    -- visual mode
    map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[g]it [s]tage hunk' })
    map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[g]it [r]eset hunk' })
    -- normal mode
    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[g]it [s]tage hunk' })
    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[g]it [r]eset hunk' })
    map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[g]it [S]tage buffer' })
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[g]it [R]eset buffer' })
    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[g]it [p]review hunk' })
    map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = '[g]it preview hunk [i]nline' })
    map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = '[g]it [b]lame line' })
    map('n', '<leader>gd', gitsigns.diffthis, { desc = '[g]it [d]iff against index' })
    map('n', '<leader>gD', function() gitsigns.diffthis '@' end, { desc = '[g]it [D]iff against last commit' })
    map('n', '<leader>gQ', function() gitsigns.setqflist 'all' end)
    map('n', '<leader>gq', gitsigns.setqflist)
    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end,
}

require('which-key').setup {
  -- delay between pressing a key and opening which-key (milliseconds)
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },

  -- Document existing key chains
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
  win = {
    border = 'rounded',
  },
  preset = 'helix',
}

require('mini.ai').setup { n_lines = 500 }

require 'plugins'

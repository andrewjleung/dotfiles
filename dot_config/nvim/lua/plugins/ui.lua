local gh = require('utils').gh

vim.pack.add {
  gh 'nvim-mini/mini.statusline',
  gh 'lukas-reineke/indent-blankline.nvim',
}

MiniStatusline = require 'mini.statusline'
-- vim.g.macro_recording = ''

MiniStatusline.setup {
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
      local git = MiniStatusline.section_git { trunc_width = 40 }
      local diff = MiniStatusline.section_diff { trunc_width = 75 }
      local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
      local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
      local filename = MiniStatusline.section_filename { trunc_width = 140 }
      -- local macro = vim.g.macro_recording
      local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
      local location = MiniStatusline.section_location { trunc_width = 75 }
      local search = MiniStatusline.section_searchcount { trunc_width = 75 }

      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        -- { hl = 'Macro', strings = { macro } },
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      }
    end,
  },
}

-- vim.api.nvim_create_autocmd('RecordingEnter', {
--   pattern = '*',
--   callback = function()
--     vim.g.macro_recording = 'Recording @' .. vim.fn.reg_recording()
--     vim.cmd 'redrawstatus'
--   end,
-- })
--
-- -- Autocmd to track the end of macro recording
-- vim.api.nvim_create_autocmd('RecordingLeave', {
--   pattern = '*',
--   callback = function()
--     vim.g.macro_recording = ''
--     vim.cmd 'redrawstatus'
--   end,
-- })

require('ibl').setup()

-- Folds

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }

-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method 'textDocument/foldingRange' then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })

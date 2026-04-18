local gh = require('utils').gh

vim.pack.add({
    gh('nvim-mini/mini.statusline'),
    gh('lukas-reineke/indent-blankline.nvim'),
})

MiniStatusline = require('mini.statusline')
vim.g.macro_recording = ''

MiniStatusline.setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local macro = vim.g.macro_recording
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl, strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'Macro', strings = { macro } },
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl, strings = { search, location } },
            })
        end,
    },
})

vim.api.nvim_create_autocmd('RecordingEnter', {
    pattern = '*',
    callback = function()
        vim.g.macro_recording = 'Recording @' .. vim.fn.reg_recording()
        vim.cmd('redrawstatus')
    end,
})

-- Autocmd to track the end of macro recording
vim.api.nvim_create_autocmd('RecordingLeave', {
    pattern = '*',
    callback = function()
        vim.g.macro_recording = ''
        vim.cmd('redrawstatus')
    end,
})

require('ibl').setup()

-- Folds

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append({ fold = ' ' })

-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
})

vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })

-- https://www.reddit.com/r/neovim/comments/1fzn1zt/custom_fold_text_function_with_treesitter_syntax/
local function fold_virt_text(result, s, lnum, coloff)
    if not coloff then coloff = 0 end
    local text = ''
    local hl
    for i = 1, #s do
        local char = s:sub(i, i)
        local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
        local _hl = hls[#hls]
        if _hl then
            local new_hl = '@' .. _hl.capture
            if new_hl ~= hl then
                table.insert(result, { text, hl })
                text = ''
                hl = nil
            end
            text = text .. char
            hl = new_hl
        else
            text = text .. char
        end
    end
    table.insert(result, { text, hl })
end

function _G.custom_foldtext()
    local start = vim.fn.getline(vim.v.foldstart):gsub('\t', string.rep(' ', vim.o.tabstop))
    local end_str = vim.fn.getline(vim.v.foldend)
    local end_ = vim.trim(end_str)
    local result = {}
    fold_virt_text(result, start, vim.v.foldstart - 1)
    table.insert(result, { ' ... ', 'Delimiter' })
    fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match('^(%s+)') or ''))
    return result
end

vim.opt.foldtext = 'v:lua.custom_foldtext()'

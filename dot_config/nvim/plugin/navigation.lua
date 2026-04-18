local gh = require('utils').gh
local map = require('utils').map

-- Fuzzy Finder (fff)

vim.pack.add({ gh('nvim-mini/mini.pick'), gh('nvim-mini/mini.extra'), gh('nvim-mini/mini.icons') })

local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')
local MiniIcons = require('mini.icons')

MiniPick.setup({})
MiniExtra.setup({})
MiniIcons.setup({})

-- https://nvim-mini.org/mini.nvim/doc/mini-pick.html#minipick-examples-differentwindowstyles
local win_config = function()
    local height = math.floor(0.8 * vim.o.lines)
    local width = math.floor(0.85 * vim.o.columns)
    return {
        border = 'rounded',
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

local mini_pick_opts = {
    window = {
        config = win_config,
    },
}

map('n', '<leader>/', function() MiniPick.builtin.grep_live({}, mini_pick_opts) end, { desc = 'live grep' })
map('n', '<leader>fb', function() MiniPick.builtin.buffers({}, mini_pick_opts) end, { desc = '[f]ind [b]uffers' })
map('n', '<leader>ff', function() MiniPick.builtin.files({}, mini_pick_opts) end, { desc = '[f]ind [f]iles' })
map('n', '<leader>fh', function() MiniPick.builtin.help({}, mini_pick_opts) end, { desc = '[f]ind [h]elp' })
map('n', '<leader>fr', function() MiniPick.builtin.resume() end, { desc = '[f]ind [r]esume' })

map('n', '<leader>fc', function() MiniExtra.pickers.commands({}, mini_pick_opts) end, { desc = '[f]ind [c]ommands' })
map('n', '<leader>fk', function() MiniExtra.pickers.keymaps({}, mini_pick_opts) end, { desc = '[f]ind [k]eymaps' })
map('n', '<leader>fm', function() MiniExtra.pickers.marks({}, mini_pick_opts) end, { desc = '[f]ind [m]arks' })

map('n', 'gd', function() MiniExtra.pickers.lsp({ scope = 'definition' }, mini_pick_opts) end, { desc = 'lsp: [g]o to [d]efinition' })
map('n', 'gD', function() MiniExtra.pickers.lsp({ scope = 'declaration' }, mini_pick_opts) end, { desc = 'lsp: [g]o to [D]eclaration' })
map('n', 'gr', function() MiniExtra.pickers.lsp({ scope = 'references' }, mini_pick_opts) end, { desc = 'lsp: [g]o to [r]eferences' })
map('n', 'gt', function() MiniExtra.pickers.lsp({ scope = 'type_definition' }, mini_pick_opts) end, { desc = 'lsp: [g]o to [t]ype definition' })
map('n', 'gt', function() MiniExtra.pickers.lsp({ scope = 'type_definition' }, mini_pick_opts) end, { desc = 'lsp: [g]o to [t]ype definition' })

map(
    'n',
    '<leader>ca',
    function()
        MiniPick.start({
            source = {
                items = vim.lsp.buf.code_action,
                name = 'lsp code actions',
            },
            window = {
                config = win_config,
            },
        })
    end,
    { desc = 'lsp: [c]ode [a]ctions' }
)

-- File Explorer (Yazi)

vim.pack.add({
    gh('nvim-lua/plenary.nvim'),
    gh('mikavilpas/yazi.nvim'),
})

map({ 'n', 'v' }, '<leader>yy', function() require('yazi').yazi() end, { desc = 'Open yazi at current file' })

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd('UIEnter', {
    callback = function()
        require('yazi').setup({
            open_for_directories = false,
            keymaps = {
                show_help = '<f1>',
            },
        })
    end,
})

-- Flash

vim.pack.add({
    gh('folke/flash.nvim'),
})

local flash = require('flash')
flash.setup()

map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
map('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
map({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
map({ 'c' }, '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })

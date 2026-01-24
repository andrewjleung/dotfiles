return {
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                transparent_background = true,
                background_clear = { "float_win" },
                override = function(c)
                    return {
                        SnacksIndent = { fg = c.editorLineNumber.foreground },
                    }
                end,
                plugins = {
                    lualine = {},
                },
            })
        end,
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                -- optional configuration here
            })
        end,
    },
    { "typicode/bg.nvim", lazy = false },
    {
        "oskarnurm/koda.nvim",
        opts = {
            transparent = true,
            colors = {
                -- override base palette here
            },
            on_highlights = function(hl, c)
                hl.MiniPickMatchRanges = { fg = c.const }
                hl.MiniStatuslineModeNormal = { fg = c.bg, bg = c.fg }
                hl.MiniIconsGrey = { fg = c.fg }
                hl.MiniIconsAzure = { fg = c.info }
                hl.MiniIconsBlue = { fg = c.highlight }
                hl.MiniIconsCyan = { fg = c.info }
                hl.MiniIconsGreen = { fg = c.green }
                hl.MiniIconsOrange = { fg = c.highlight }
                hl.MiniIconsPurple = { fg = c.orange }
                hl.MiniIconsRed = { fg = c.red }
                hl.MiniIconsYellow = { fg = c.yellow }
            end,
        },
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "koda",
        },
    },
}

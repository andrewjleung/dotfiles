return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            explorer = {
                enabled = false,
            },
            indent = {},
            notifier = {
                style = "fancy",
            },
            styles = {
                notification = {
                    wo = {
                        winblend = 0,
                    },
                },
            },
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({
                options = {
                    multilines = {
                        enabled = true,
                        always_show = true,
                    },
                    show_source = {
                        enabled = true,
                    },
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = { virtual_text = false },
            inlay_hints = { enabled = false },
        },
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (" 󰁂 %d "):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, "MoreMsg" })
                return newVirtText
            end

            require("ufo").setup({
                fold_virt_text_handler = handler,
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })
        end,
        keys = {
            { "<leader>z", "za", "Toggle fold under cursor (alias 'za')" },
        },
    },
    {
        "folke/noice.nvim",
        opts = {
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "search_count",
                    },
                    opts = { skip = true },
                },
            },
            presets = {
                lsp_doc_border = true,
            },
            lsp = {
                signature = {
                    enabled = false,
                },
            },
        },
    },

    {
        "Bekaboo/deadcolumn.nvim",
        config = function()
            require("deadcolumn").setup({
                scope = "buffer",
            })
        end,
    },
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "oskarnurm/koda.nvim",
            "folke/twilight.nvim",
        },
        opts = {
            twilight = {
                enabled = false,
            },
        },
    },
}

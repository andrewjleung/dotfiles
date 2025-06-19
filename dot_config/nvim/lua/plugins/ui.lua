return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
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
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {},
      sections = {
        lualine_b = { "branch" },
        lualine_x = { "fileformat", "filetype" },
        lualine_y = {},
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    opts = {
      preset = "classic",
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require("ufo").setup()
    end,
    keys = {
      { "<leader>z", "za", "Toggle fold under cursor (alias 'za')" },
    },
  },
}

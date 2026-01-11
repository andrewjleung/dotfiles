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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("koda").setup({ transparent = true })
      vim.cmd("colorscheme koda")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "koda",
    },
  },
}

return {
  -- add monokai pro
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        override = function(c)
          return {
            SnacksIndent = { fg = c.editorLineNumber.foreground },
          }
        end,
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

  -- configure LazyVim to use monokai pro
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}

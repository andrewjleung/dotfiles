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
}

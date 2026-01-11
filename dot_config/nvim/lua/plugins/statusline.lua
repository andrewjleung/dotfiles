return {
  {
    "nvim-mini/mini.statusline",
    config = function()
      require("mini.statusline").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "filename" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = {
          {
            "macro",
            fmt = function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return "rec @" .. reg
              end
              return nil
            end,
            color = { fg = "#fc9867" },
            draw_empty = false,
          },
          "filetype",
          "lsp_status",
        },
        lualine_z = { "location" },
      },
      config = function()
        local custom_koda = require("koda.palette.dark")
        custom_koda.bg = "none"
        require("lualine").setup({ options = { theme = custom_koda } })
      end,
    },
  },
}

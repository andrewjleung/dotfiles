return {
  {
    "codethread/qmk.nvim",
    config = function()
      --@type qmk.UserConfig
      local conf = {
        name = "LAYOUT_glove80",
        variant = "zmk",
        layout = {
          "x x x x x _ _ _ _ _ _ _ _ _ x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x x x x _ x x x x x x x x x",
          "x x x x x _ x x x _ x x x _ x x x x x",
        },
      }
      require("qmk").setup(conf)
    end,
  },
  {
    "tpope/vim-dispatch",
    keys = {
      {
        "<leader>rr",
        function()
          local current_line_num = vim.fn.line(".") - 1
          local start_line_num = current_line_num
          local end_line_num = current_line_num
          local bufnr = vim.api.nvim_get_current_buf()

          while start_line_num >= 0 do
            local line = vim.api.nvim_buf_get_lines(bufnr, start_line_num, start_line_num + 1, false)[1]

            if line == "" then
              start_line_num = start_line_num + 1
              break
            end

            if start_line_num < 1 then
              break
            end

            start_line_num = start_line_num - 1
          end

          local line_count = vim.api.nvim_buf_line_count(bufnr)
          while end_line_num < line_count do
            local line = vim.api.nvim_buf_get_lines(bufnr, end_line_num, end_line_num + 1, false)[1]

            if line == "" then
              break
            end

            end_line_num = end_line_num + 1
          end

          local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), start_line_num, end_line_num, false)
          local paragraph = table.concat(lines, "\n")

          if paragraph == "" then
            vim.notify("Nothing to dispatch!", vim.log.levels.INFO)
            return
          end

          vim.cmd.Dispatch(paragraph)
        end,
        desc = "Run the current paragraph (dispatch)",
      },
    },
  },
}

return {
  "tpope/vim-dispatch",
  keys = {
    {
      "<leader>rl",
      function()
        vim.cmd.Dispatch(vim.api.nvim_get_current_line():gsub("(?:^%s+|%s+$)", ""))
      end,
      desc = "Run the current line (dispatch)",
    },
  },
}

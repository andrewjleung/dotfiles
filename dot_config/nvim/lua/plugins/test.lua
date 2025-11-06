return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dN",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Clear all breakpoints",
      },
    },
  },
}

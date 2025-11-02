return {
  {
    "nvim-neotest/neotest",
    opts = {
      floating = {
        border = "rounded",
      },
      adapters = {
        require("neotest-python"),
      },
    },
  },
}

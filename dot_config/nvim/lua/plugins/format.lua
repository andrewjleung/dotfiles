return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt", "beautysh" },
        typst = { "typstyle" },
        go = { "gofumpt", "goimports" },
        liquid = { "prettier" },
      },
    },
  },
}

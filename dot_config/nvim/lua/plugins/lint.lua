return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
        markdown = { "markdownlint-cli2" },
        sql = { "sqlfluff" },
      },
    },
  },
}

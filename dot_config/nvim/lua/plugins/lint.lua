return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                markdown = { "markdownlint-cli2" },
                proto = { "buf_ls" },
                sql = { "sqlfluff" },
                toml = { "tombi" },
            },
        },
    },
}

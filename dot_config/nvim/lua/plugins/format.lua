return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                astro = { "biome", "prettier" },
                go = { "gofumpt", "goimports" },
                liquid = { "prettier" },
                lua = { "stylua" },
                proto = { "buf_ls" },
                sh = { "shfmt", "beautysh" },
                toml = { "tombi" },
                typst = { "typstyle" },
            },
        },
    },
}

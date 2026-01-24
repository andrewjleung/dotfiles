return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                -- astro = { "biome" },
                -- css = { "biome-check" },
                -- javascript = { "biome-check" },
                -- javascriptreact = { "biome-check" },
                -- typescript = { "biome-check" },
                typescriptreact = { "biome-check" },
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

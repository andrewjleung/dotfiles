return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = { border = "rounded" },
            ensure_installed = {
                "astro-language-server",
                "bash-language-server",
                "biome",
                "buf",
                "css-lsp",
                "gopls",
                "json-lsp",
                "lua-language-server",
                "marksman",
                "prettier",
                "ruff",
                "rust-analyzer",
                "shopify-cli",
                "tailwindcss-language-server",
                "tinymist",
                "tombi",
                "vtsls",
                "yaml-language-server",
            },
        },
    },
}

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      ensure_installed = {
        "bash-language-server",
        "biome",
        "buf",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "ruff",
        "shopify-cli",
        "tailwindcss-language-server",
        "tinymist",
        "tombi",
        "vtsls",
        "yaml-language-server",
        -- "rust-analyzer",
      },
    },
  },
}

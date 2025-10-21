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
        -- "rust-analyzer",
        "shopify-cli",
        "tailwindcss-language-server",
        "taplo",
        "tinymist",
        "vtsls",
        "yaml-language-server",
      },
    },
  },
}

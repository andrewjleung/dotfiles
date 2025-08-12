local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "biome-check", "biome", "prettier" },
		typescript = { "biome-check", "biome", "prettier" },
		typescriptreact = { "biome-check", "biome", "prettierd", "prettier" },
		markdown = { "markdownlint" },
		rust = { "rustfmt" },
		go = { "goimports", "gofmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	notify_on_error = false,
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		javascript = { "biome-check", "biome" },
		typescript = { "biome-check", "biome" },
		typescriptreact = { "biome-check", "biome" },
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

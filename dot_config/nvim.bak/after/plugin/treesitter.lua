local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"bash",
		"dockerfile",
		"git_rebase",
		"gitignore",
		"git_config",
		"go",
		"html",
		"json",
		"latex",
		"make",
		"markdown_inline",
		"prisma",
		"python",
		"rust",
		"tmux",
		"yaml",
		"xml",
	},
	highlight = { enable = true },
})

vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

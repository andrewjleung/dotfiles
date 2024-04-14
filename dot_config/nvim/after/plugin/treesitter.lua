local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
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
})

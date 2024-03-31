require("lint").linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	typescriptreact = { "biomejs" },
	markdown = { "vale" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.diagnostic.config({ virtual_text = true })

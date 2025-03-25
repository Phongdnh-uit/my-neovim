return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			border = "rounded",
		})
		vim.keymap.set("n", "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "[T]oggle [T]erminal" })
		vim.keymap.set(
			"t",
			"<leader>tt",
			'<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
			{ desc = "[T]oggle [T]erminal" }
		)
	end,
}

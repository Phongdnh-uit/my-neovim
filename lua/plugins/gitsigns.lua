return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()
		local gitsigns = require("gitsigns")
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end
		-- Actions
		map("n", "<leader>hp", gitsigns.preview_hunk,{desc = "[P]review [H]unk"})
		map("n", "<leader>hi", gitsigns.preview_hunk_inline, {desc = "[P]review [H]unk [I]nline"})
		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame, {desc = "[T]oggle [C]urrent [L]ine [B]lame"})
		map("n", "<leader>td", gitsigns.toggle_deleted, {desc = "[T]oggle [D]eleted"})
		map("n", "<leader>tw", gitsigns.toggle_word_diff, {desc = "[T]oggle [W]ord [D]iff"})
	end,
}

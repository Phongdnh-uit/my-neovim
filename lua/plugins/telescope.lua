return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.setup({
				defaults = {
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					file_ignore_patterns = { "%.class$" },
				},
				pickers = {
					find_files = { hidden = true },
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
			vim.keymap.set(
				"n",
				"<leader>ff",
				builtin.find_files,
				{ noremap = true, silent = true, desc = "[T]elescope [F]ind [F]iles" }
			)
			vim.keymap.set(
				"n",
				"<leader>fb",
				builtin.buffers,
				{ noremap = true, silent = true, desc = "[T]elescope [B]uffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>fg",
				builtin.live_grep,
				{ noremap = true, silent = true, desc = "[T]elescope [L]ive [G]rep" }
			)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
				noremap = true,
				silent = true,
				desc = "[T]elescope [H]elp Tags",
			})
			vim.keymap.set(
				"n",
				"<leader>gc",
				builtin.git_commits,
				{ noremap = true, silent = true, desc = "[T]elescope [G]it [C]ommits" }
			)
			vim.keymap.set(
				"n",
				"<leader>gs",
				builtin.git_status,
				{ noremap = true, silent = true, desc = "[T]elescope [G]it [S]tatus" }
			)
		end,
	},
}

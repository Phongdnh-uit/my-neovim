-- 1.7 Autocmds

-- 1. Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text briefly",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- 2. Show cursorline only in the active window
local cursorline_group = vim.api.nvim_create_augroup("active_cursorline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	desc = "Enable cursorline in active window",
	group = cursorline_group,
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	desc = "Disable cursorline in inactive window",
	group = cursorline_group,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

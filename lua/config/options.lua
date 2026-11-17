-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mousemoveevent = true
vim.opt.colorcolumn = "94"
vim.opt.signcolumn = "yes"
vim.opt.visualbell = true
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.iskeyword:append("-")
vim.opt.cmdheight = 0
vim.opt.wrap = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.showmatch = true
vim.opt.title = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Files & completion
vim.opt.path:append("**")
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*/node_modules/*", "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Persistent Undo & Backup
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")

-- Timing
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- 1.6 Messages (Neovim 0.12 experimental ui2)
local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
if ok_ui2 then
	ui2.enable({
		enable = true,
		msg = {
			targets = {
				[""] = "msg",
				empty = "cmd",
				bufwrite = "msg",
				confirm = "cmd",
				emsg = "pager",
				echo = "msg",
				echomsg = "msg",
				echoerr = "pager",
				completion = "cmd",
				lua_error = "pager",
				lua_print = "msg",
				progress = "pager",
				quickfix = "msg",
				search_cmd = "cmd",
				search_count = "cmd",
				shell_cmd = "pager",
				shell_err = "pager",
				shell_out = "pager",
				shell_ret = "msg",
				undo = "msg",
				verbose = "pager",
				wildlist = "cmd",
				wmsg = "msg",
				typed_cmd = "cmd",
			},
			cmd = { height = 0.5 },
			dialog = { height = 0.5 },
			msg = { height = 0.3, timeout = 5000 },
			pager = { height = 0.5 },
		},
	})
end

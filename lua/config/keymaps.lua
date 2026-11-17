-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps

-- Normal mode keymaps
vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true, desc = "Escape from insert mode" })

-- Indent
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Unindent line" })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent line" })

-- Quick move
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up" })

-- Buffer management
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close active buffer" })
vim.keymap.set("n", "<leader>bd", function()
	local count = 0
	for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
		if #buf.windows == 0 and buf.changed == 0 then
			vim.api.nvim_buf_delete(buf.bufnr, { force = false })
			count = count + 1
		end
	end
	vim.notify("Closed " .. count .. " hidden buffer(s)", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Close hidden buffers" })

-- Window management
vim.keymap.set(
	"n",
	"<S-Right>",
	":vertical resize -2<CR>",
	{ noremap = true, silent = true, desc = "Resize window right" }
)
vim.keymap.set(
	"n",
	"<S-Left>",
	":vertical resize +2<CR>",
	{ noremap = true, silent = true, desc = "Resize window left" }
)
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize window up" })
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize window down" })

-- Split window
vim.keymap.set("n", "<leader>sh", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sv", ":split<CR>", { noremap = true, silent = true, desc = "Split window vertically" })

-- Fold
vim.keymap.set("n", "<leader>ft", "za", { noremap = true, silent = true, desc = "Toggle fold" })

-- DadBod
vim.keymap.set("n", "<leader>dd", ":DBUIToggle<CR>", { noremap = true, silent = true, desc = "[T]oggle [D]adBod" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true, desc = "Select all" })

-- 6.4 Lazygit (via Snacks terminal)
vim.keymap.set("n", "<leader>lg", function()
	Snacks.terminal("lazygit", {
		cwd = vim.fn.getcwd(),
		win = {
			border = "rounded",
			style = "float",
		},
	})
end, { desc = "Open Lazygit" })

-- Helper lấy đường dẫn (tương đối hoặc tuyệt đối) kèm số dòng hoặc khoảng dòng nếu đang ở Visual mode
local function copy_path_with_lines(modifier)
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), modifier)
	local mode = vim.fn.mode()

	if mode == "v" or mode == "V" or mode == "\22" then
		local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
		vim.api.nvim_feedkeys(esc, "x", false)
		local start_line = vim.fn.line("'<")
		local end_line = vim.fn.line("'>")
		if start_line == end_line then
			return string.format("%s#L%d", path, start_line)
		else
			return string.format("%s#L%d-L%d", path, start_line, end_line)
		end
	end

	return string.format("%s#L%d", path, vim.fn.line("."))
end

-- <leader>yf: Copy relative path + line(s) (vd: src/App.java#L10-L25)
vim.keymap.set({ "n", "v" }, "<leader>yf", function()
	local result = copy_path_with_lines(":~:.")
	vim.fn.setreg("+", result)
	vim.notify("Copied: " .. result, vim.log.levels.INFO)
end, { desc = "Copy relative path with line(s)" })

-- <leader>yp: Copy absolute path + line(s) (vd: /home/dang-phong/project/src/App.java#L10-L25)
vim.keymap.set({ "n", "v" }, "<leader>yp", function()
	local result = copy_path_with_lines(":p")
	vim.fn.setreg("+", result)
	vim.notify("Copied: " .. result, vim.log.levels.INFO)
end, { desc = "Copy absolute path with line(s)" })

-- <leader>cc: Copy visual selection as Markdown code block with file & line metadata
vim.keymap.set("v", "<leader>cc", function()
	local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "x", false)

	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local buf_name = vim.api.nvim_buf_get_name(0)
	local rel_path = vim.fn.fnamemodify(buf_name, ":~:.")
	local ext = vim.fn.fnamemodify(buf_name, ":e")
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	local code = table.concat(lines, "\n")

	local result = string.format('```%s filename="%s" line=%d\n%s\n```', ext, rel_path, start_line, code)
	vim.fn.setreg("+", result)
	vim.notify(string.format("Copied code block: %s#L%d-L%d", rel_path, start_line, end_line), vim.log.levels.INFO)
end, { desc = "Copy selection as Markdown code block" })

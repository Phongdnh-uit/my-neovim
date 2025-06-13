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

-- Keymaps
vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pv", ":Vex<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })

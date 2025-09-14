-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps

-- Normal mode keymaps
vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true })

-- Indent
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- Quick move
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Quit
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })

-- Window management
vim.keymap.set("n", "<S-Right>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", { noremap = true, silent = true })

-- Split window
vim.keymap.set("n", "<leader>sh", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sv", ":split<CR>", { noremap = true, silent = true })

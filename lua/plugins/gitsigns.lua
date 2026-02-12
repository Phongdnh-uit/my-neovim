return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            auto_attach = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 0,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
        })
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        -- Actions
        map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "[G]it [P]review [H]unk" })
        map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "[G]it [P]review [H]unk [I]nline" })
        -- Toggles
        map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "[G]it [T]oggle [C]urrent [L]ine [B]lame" })
        map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "[G]it [T]oggle [D]eleted" })
        map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "[G]it [T]oggle [W]ord [D]iff" })
    end,
}

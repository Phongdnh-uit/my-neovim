return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
    config = function()
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {noremap = true, silent = true} )
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            default_component_configs = {
                name = {
                    trailing_slash = true,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                symbols = {
                  added = "+",
                  modified = "",
                  deleted = "✖",
                  renamed = "󰁕",
                  untracked = "",
                  ignored = "",
                  unstaged = "",
                  staged = "",
                  conflict = "",
                }
            }
          },
        })
    end
}

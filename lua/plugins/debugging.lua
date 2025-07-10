return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup({
            sidebar = {
                elements = {
                    "scopes",
                    "watches",
                    "scopes",
                },
                width = 40,
                position = "left",
            },
        })
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        -- dap.listeners.before.event_terminated.dapui_config = function()
        --     dapui.close()
        -- end
        -- dap.listeners.before.event_exited.dapui_config = function()
        --     dapui.close()
        -- end

        local opts = { noremap = true, silent = true }

        local function nmap(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end

        -- DAP key mappings --
        nmap("<leader>dc", dap.continue, "[D]ebug [C]ontinue")
        nmap("<leader>dn", dap.step_over, "[D]ebug [S]tep Over")
        nmap("<leader>di", dap.step_into, "[D]ebug [S]tep [I]nto")
        nmap("<leader>do", dap.step_out, "[D]ebug [S]tep [O]ut")
        nmap("<leader>db", dap.toggle_breakpoint, "[D]ebug [T]oggle Breakpoint")
        nmap("<leader>dr", dap.restart, "[D]ebug [R]estart")
        nmap("<leader>dt", dap.terminate, "[D]ebug [T]erminate")

        nmap("<C-b>", dapui.toggle, "[D]ebug [T]oggle UI")
    end,
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
		vim.keymap.set("n", "<F10>", dap.step_over, { noremap = true, silent = true })
		vim.keymap.set("n", "<F11>", dap.step_into, { noremap = true, silent = true })
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { noremap = true, silent = true })
		vim.keymap.set("n", "<F12>", dap.terminate, { noremap = true, silent = true })

		vim.keymap.set("n", "<C-b>", dapui.toggle, { noremap = true, silent = true })
	end,
}

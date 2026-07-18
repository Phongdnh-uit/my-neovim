return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-go").setup({
			dap_configurations = {
				{
					-- Must be "go" or it will be ignored by the plugin
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
			-- delve configurations
			delve = {
				path = vim.fn.expand("~/.local/share/nvim/mason/packages/delve/dlv"),
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = {},
				detached = vim.fn.has("win32") == 0,
				cwd = nil,
			},
			tests = {
				verbose = false,
			},
		})
	end,
}

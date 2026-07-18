return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- add any opts here
		-- this file can contain specific instructions for your project
		instructions_file = "avante.md",
		-- for example
		provider = "copilot",
		providers = {
			-- claude = {
			-- 	endpoint = "https://api.anthropic.com",
			-- 	model = "claude-sonnet-4-20250514",
			-- 	timeout = 30000, -- Timeout in milliseconds
			-- 	extra_request_body = {
			-- 		temperature = 0.75,
			-- 		max_tokens = 20480,
			-- 	},
			-- },
			-- moonshot = {
			-- 	endpoint = "https://api.moonshot.ai/v1",
			-- 	model = "kimi-k2-0711-preview",
			-- 	timeout = 30000, -- Timeout in milliseconds
			-- 	extra_request_body = {
			-- 		temperature = 0.75,
			-- 		max_tokens = 32768,
			-- 	},
			-- },
		},
		repo_map = {
			ignore_patterns = { "%.git/?", "%.worktree/?", "node_modules/?", "target/?", "build/?" },
		},
		project_root = { ".git", "pom.xml", "build.gradle", "build.gradle.kts" },
		behaviour = {
			auto_apply_diff_after_generation = false,
			auto_approve_tool_permissions = false,
		},
		windows = {
			width = 40, -- default % based on available width
			input = {
				prefix = "> ",
				height = 12, -- Height of the input window in vertical layout
			},
		},
		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub and hub:get_active_servers_prompt() or ""
		end,
		-- Using function prevents requiring mcphub before it's loaded
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-mini/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			config = function()
				require("copilot").setup({
					suggestion = {
						enabled = true,
						auto_trigger = true, -- Tự động hiện ghost text khi đang gõ
						hide_during_completion = true,
						debounce = 75,
						keymap = {
							accept = "<S-Tab>",
							accept_word = false,
							accept_line = false,
							next = "<M-]>",
							prev = "<M-[>",
							dismiss = "<C-]>",
						},
					},
				})
			end,
		},
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}

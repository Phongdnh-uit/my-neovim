local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

local root_markers = { "settings.gradle.kts", ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts" }
local root_dir = vim.fs.root(0, root_markers)

if not root_dir then
	return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Special case: company/backend vs personal/backend, we want to use the full path as the workspace name to avoid conflicts
local unique_project_name = string.gsub(string.gsub(root_dir, "^/", ""), "/", "-")
local workspace_dir = workspace_path .. unique_project_name

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ERROR",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-jar",
		vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,

	settings = {
		java = {
			import = {
				gradle = {
					enabled = true,
				},
				maven = {
					enabled = true,
				},
			},
			signatureHelp = { enabled = true },
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			format = {
				enabled = false,
			},
		},
	},

	init_options = {
		bundles = {
			vim.fn.glob(
				home
					.. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		},
	},
}

-- Add spring-boot jdtls extension jars
local status_sb, spring_boot = pcall(require, "spring_boot")
if status_sb then
	vim.list_extend(config.init_options.bundles, spring_boot.java_extensions())
end

-- vim.list_extend(config.init_options.bundles, require("spring_boot").java_extensions())

jdtls.start_or_attach(config)

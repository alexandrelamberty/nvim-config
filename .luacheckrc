-- .luacheckrc

-- Configuration for luacheck
-- Adjust as needed based on your preferences and project requirements

-- Specify the globals that are defined elsewhere (e.g., Neovim API globals)
globals = {
	vim = "global",
	packer_plugins = "global",
	use = "global",
}

-- Specify the checks to perform
-- See luacheck documentation for available options: https://luacheck.readthedocs.io/en/stable/
checks = {
	unused = false, -- Disable unused variable checks (useful for Neovim API calls)
}

-- Specify the files and directories to check
files = { "*.lua", "autoload/**/*.lua", "plugin/**/*.lua" }

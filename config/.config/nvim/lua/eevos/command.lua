--- Command
-- module command
-- @see https://neovim.io/doc/user/api.html#api-command

-- Build spell file
vim.api.nvim_create_user_command(
	'SpellBuild',
	"echo 'Building spell file'",
	{ bang = true, desc = "Build spell file" }
)

-- Open remote Git repository
vim.api.nvim_create_user_command(
	'GitRepo',
	"lua require('eevos.utils').open_git_repo()",
	{ bang = true, desc = "Open remote Git repository" }
)

vim.api.nvim_create_user_command(
    'Upper',
    function(opts)
        print(string.upper(opts.args))
    end,
    { nargs = 1 }
)

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function toggle_floaterm_with_makeprg()
	local makeprg_value = vim.api.nvim_get_option_value('makeprg', {})
	local command = string.format('FloatermSend %s\n', makeprg_value)
	vim.cmd 'FloatermToggle'
	vim.cmd(command)
end

vim.keymap.set('n', '<C-b>', toggle_floaterm_with_makeprg, { noremap = true })
vim.keymap.set('n', '<C-j>', ':FloatermToggle<CR>', { desc = 'Toggle floaterm' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle floaterm' })
vim.keymap.set('t', '<C-b>', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle floaterm' })

vim.keymap.set('n', '<leader>cc', ':Compile<CR>', { desc = 'Compile' })
vim.keymap.set('n', '<leader>cr', ':Recompile<CR>', { desc = 'Recompile' })

return {
	{ 'voldikss/vim-floaterm' },
	{ 'blazkowolf/gruber-darker.nvim' },
	{
		"ej-shafran/compile-mode.nvim",
		version = "^5.0.0",
		-- you can just use the latest version:
		-- branch = "latest",
		-- or the most up-to-date updates:
		-- branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- if you want to enable coloring of ANSI escape codes in
			-- compilation output, add:
			-- { "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		config = function()
			vim.g.compile_mode = {
				-- if you use something like `nvim-cmp` or `blink.cmp` for completion,
				-- set this to fix tab completion in command mode:
				-- input_word_completion = true,

				-- to add ANSI escape code support, add:
				-- baleia_setup = true,

				-- to make `:Compile` replace special characters (e.g. `%`) in
				-- the command (and behave more like `:!`), add:
				-- bang_expansion = true,
			}
		end
	}
}

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

return {
  { 'voldikss/vim-floaterm' },
}

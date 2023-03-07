vim.opt.encoding = 'utf8'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.scrolloff = 7
vim.opt.colorcolumn = '121'
vim.opt.relativenumber = true

vim.api.nvim_command('retab')
vim.cmd('filetype plugin indent on')
vim.opt.syntax = 'enable'


vim.keymap.set('n', '<leader>1', ':bp<CR>')
vim.keymap.set('n', '<leader>2', ':bn<CR>')
vim.keymap.set('n', '<leader>w', ':bd<CR>')

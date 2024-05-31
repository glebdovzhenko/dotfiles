vim.opt.encoding = 'utf8'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.scrolloff = 7
vim.opt.colorcolumn = '80'
vim.opt.relativenumber = true

vim.api.nvim_command('retab')
vim.cmd('filetype plugin indent on')
vim.opt.syntax = 'enable'

-- general -----------------------------------------------------------------
-- Moving code blocks in visual mode
vim.keymap.set('v', 'J',
    ":m '>+1<CR>gv=gv",
    { desc = 'Move code block one line down' })
vim.keymap.set('v', 'K',
    ":m '<-2<CR>gv=gv",
    { desc = 'Move code block one line up' })
-- cursor stays in the middle of screen when jumping
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
-- search terms are in the middle of screen when jumping
vim.keymap.set('n', 'n', "nzzzv", { desc = 'Next search term' })
vim.keymap.set('n', 'N', "Nzzzv", { desc = 'Prev search term' })
-- paste over selection without overwriting copy buffer
vim.keymap.set('x', '<leader>p',
    "\"_dP",
    { desc = 'Paste without overwriting the buffer' })
-- copying to system clipboard
vim.keymap.set('n', '<leader>y',
    "\"+y",
    { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y',
    "\"+y",
    { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y',
    "\"+Y",
    { desc = 'Yank to system clipboard' })
-- deleting to void register
vim.keymap.set('n', '<leader>d',
    "\"_d",
    { desc = 'Delete to void register' })
vim.keymap.set('v', '<leader>d',
    "\"_d",
    { desc = 'Delete to void register' })
-- search and replace the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- ToggleTerm -----------------------------------------------------------------

--vim.keymap.set('n', '<leader>g',
--    function()
--        local term = require('toggleterm.terminal').Terminal
--        local lg = term:new({
--            cmd = "lazygit",
--            hidden = true,
--            direction = "float"
--        })
--        lg:toggle()
--    end,
--    { desc = "Lazygit over ToggleTerm floating terminal" })

-- Telescope ------------------------------------------------------------------
vim.keymap.set('n', '<leader>F',
    function()
        local tb = require('telescope.builtin')
        tb.find_files()
    end,
    { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>f',
    function()
        local tb = require('telescope.builtin')
        tb.live_grep()
    end,
    { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>h',
    function()
        local tb = require('telescope.builtin')
        tb.help_tags()
    end,
    { desc = 'Telescope help tags' })

-- nvim-tree ------------------------------------------------------------------
--vim.keymap.set('n', '<leader>`',
--    ':NvimTreeToggle<CR>',
--    { desc = 'Toggle nvim-tree' })
----vim.keymap.set('n', '<C-/>',
----    ':NvimTreeToggle<CR>',
----    { desc = 'Toggle nvim-tree' })
--vim.keymap.set('n', '<leader>R',
--    ':NvimTreeRefresh<CR>',
--    { desc = 'Refresh nvim-tree' })

-- bufferline -----------------------------------------------------------------
vim.keymap.set('n', '<leader>1',
    ':bp<CR>',
    { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>2',
    ':bn<CR>',
    { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>w',
    ':bd<CR>',
    { desc = 'Close buffer' })

-- NERDCommenter --------------------------------------------------------------
vim.keymap.set('n', '<leader>cl',
    '<Plug>NERDCommenterAlignLeft',
    { silent = true, desc = 'Comment line(s) with delimiters aligned left.' })
vim.keymap.set('x', '<leader>cl',
    '<Plug>NERDCommenterAlignLeft',
    { silent = true, desc = 'Comment line(s) with delimiters aligned left.' })
vim.keymap.set('n',
    '<leader>cu',
    '<Plug>NERDCommenterUncomment',
    { desc = 'Uncomment line(s).', silent = true })
vim.keymap.set('x',
    '<leader>cu',
    '<Plug>NERDCommenterUncomment',
    { silent = true, desc = 'Uncomment line(s).' })

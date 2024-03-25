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
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")
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

-- Harpoon --------------------------------------------------------------------
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local conf = require("telescope.config").values
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({})
    }):find()
end

local harpoon = require("harpoon")
vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window via Telescope" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)

-- ToggleTerm -----------------------------------------------------------------

vim.keymap.set('n', '<leader>g',
    function()
        local term = require('toggleterm.terminal').Terminal
        local lg = term:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float"
        })
        lg:toggle()
    end,
    { desc = "Lazygit over ToggleTerm floating terminal" })

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
vim.keymap.set('n', '<leader>`',
    ':NvimTreeToggle<CR>',
    { desc = 'Toggle nvim-tree' })
vim.keymap.set('n', '<leader>R',
    ':NvimTreeRefresh<CR>',
    { desc = 'Refresh nvim-tree' })

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

--vim.keymap.set('n',
--    '<leader>cy',
--    '<Plug>NERDCommenterYank',
--    { silent = true, description = 'Comment line(s) and yank the selection.' })
--vim.keymap.set('x',
--    '<leader>cy',
--    '<Plug>NERDCommenterYank',
--    { silent = true, description = 'Comment line(s) and yank the selection.' })

---- TODO: move to only when LSP is attached
--{ 'gD',       vim.lsp.buf.declaration,     description = 'Find declaration' },
--{ 'gd',       vim.lsp.buf.definition,      description = 'Find definition' },
--{ 'K',        vim.lsp.buf.hover,           description = 'Show help' },

---- diagnostics
--{ '<space>e', vim.diagnostic.open_float,   description = 'Open diagnostics' },
--{ '<space>q', vim.diagnostic.set_loc_list, description = 'List diagnostics' },
--{ '[d',       vim.diagnostic.goto_prev,    description = 'GoTo previous diagnoctic' },
--{ ']d',       vim.diagnostic.goto_next,    description = 'GoTo next diagnostic' },

--{
--    '<space>f',
--    function()
--        vim.lsp.buf.format { async = true }
--    end,
--    description = 'Format current buffer'
--},

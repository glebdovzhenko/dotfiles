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


require('legendary').setup({
    keymaps = {
        -- legendary ----------------------------------------------------------
        {
            '<leader>H',
            ':Legendary<CR>',
            description = 'Run command search'
        },

        -- ToggleTerm ---------------------------------------------------------
        {
            '<leader>g',
            function()
                local term = require('toggleterm.terminal').Terminal
                local lg = term:new({
                    cmd = "lazygit",
                    hidden = true,
                    direction = "float"
                })
                lg:toggle()
            end,
            description = 'Lazygit over ToggleTerm floating terminal'
        },

        -- Telescope ----------------------------------------------------------
        {
            '<leader>F',
            function()
                local tb = require('telescope.builtin')
                tb.find_files()
            end,
            description = 'Telescope find files'
        },
        {
            '<leader>f',
            function()
                local tb = require('telescope.builtin')
                tb.live_grep()
            end,
            description = 'Telescope live grep'
        },
        {
            '<leader>h',
            function()
                local tb = require('telescope.builtin')
                tb.help_tags()
            end,
            description = 'Telescope help tags'
        },

        -- nvim-tree ----------------------------------------------------------
        { '<leader>`', ':NvimTreeToggle<CR>',       description = 'Toggle nvim-tree' },
        { '<leader>R', ':NvimTreeRefresh<CR>',      description = 'Refresh nvim-tree' },

        -- bufferline ---------------------------------------------------------
        { '<leader>1', ':bp<CR>',                   description = 'Prev buffer' },
        { '<leader>2', ':bn<CR>',                   description = 'Next buffer' },
        { '<leader>w', ':bd<CR>',                   description = 'Close buffer' },

        -- LSP ----------------------------------------------------------------
        -- TODO: move to only when LSP is attached
        { 'gD',        vim.lsp.buf.declaration,     description = 'Find declaration' },
        { 'gd',        vim.lsp.buf.definition,      description = 'Find definition' },
        { 'K',         vim.lsp.buf.hover,           description = 'Show help' },

        -- diagnostics
        { '<space>e',  vim.diagnostic.open_float,   description = 'Open diagnostics' },
        { '<space>q',  vim.diagnostic.set_loc_list, description = 'List diagnostics' },
        { '[d',        vim.diagnostic.goto_prev,    description = 'GoTo previous diagnoctic' },
        { ']d',        vim.diagnostic.goto_next,    description = 'GoTo next diagnostic' },

        {
            '<space>f',
            function()
                vim.lsp.buf.format { async = true }
            end,
            description = 'Format current buffer'
        },

        -- NERDCommenter ------------------------------------------------------
        {
            '<leader>cl',
            { n = '<Plug>NERDCommenterAlignLeft', x = '<Plug>NERDCommenterAlignLeft' },
            opts = { silent = true },
            description = 'Comment line(s) with delimiters aligned left.'
        },
        {
            '<leader>cu',
            { n = '<Plug>NERDCommenterUncomment', x = '<Plug>NERDCommenterUncomment' },
            opts = { silent = true },
            description = 'Uncomment line(s).'
        },
        {
            '<leader>cy',
            { n = '<Plug>NERDCommenterYank', x = '<Plug>NERDCommenterYank' },
            opts = { silent = true },
            description = 'Comment line(s) and yank the selection.'
        },
    },
    autocmds = {
        {
            'InsertEnter',
            function()
                vim.opt.relativenumber = false
            end,
            description = 'Switch from relative to absolute line numbers'
        },
        {
            'InsertLeave',
            function()
                vim.opt.relativenumber = true
            end,
            description = 'Switch from absolute to relative line numbers'
        },
        {
            'BufWritePost',
            function ()
                if vim.bo.filetype == 'python' then
                    vim.api.nvim_command('!black %')
                end
            end,
            description = 'Run black formatter on autosave'
        },
    }
})

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
  keymaps={
    -- legendary
    {'<leader>H', ':Legendary<CR>',
     description = 'Run command search'},

    -- ToggleTerm
    {'<leader>t', ':ToggleTerm direction=float<CR>',
    description = 'ToggleTerm floating terminal'},
    {'<leader>g',
    function()
        local term = require('toggleterm.terminal').Terminal
        local lg = term:new({
            cmd = "lazygit", 
            hidden = true, 
            direction = "float"
        })
        lg:toggle()
    end,
    description = 'Lazygit over ToggleTerm floating terminal'},

    -- Telescope
    {'<leader>F',
    function()
        local tb = require('telescope.builtin')
        tb.find_files()
    end,
    description='Telescope find files'},
    {'<leader>f',
    function()
        local tb = require('telescope.builtin')
        tb.live_grep()
    end,
    description='Telescope live grep'},
    {'<leader>h',
    function()
        local tb = require('telescope.builtin')
        tb.help_tags()
    end,
    description='Telescope help tags'},

    -- nvim-tree
    {'<leader>`', ':NvimTreeToggle<CR>', description='Toggle nvim-tree'},
    {'<leader>r', ':NvimTreeRefresh<CR>', description='Refresh nvim-tree'},

    -- bufferline
    {'<leader>1', ':bp<CR>', description='Prev buffer'},
    {'<leader>2', ':bn<CR>', description='Next buffer'},
    {'<leader>w', ':bd<CR>', description='Close buffer'},

    -- coc nvim ---------------------------------------------------------------
    -- code navigation
    {'gd', '<Plug>(coc-definition)', opts = {silent=true},
    description='CoC GoTo definition'},
    {'gy', '<Plug>(coc-type-definition)', opts = {silent=true},
    description='CoC GoTo type definition'},
    {'gi', '<Plug>(coc-implementation)', opts = {silent=true},
    description='CoC GoTo implementation'},
    {'gr', '<Plug>(coc-references)', opts = {silent=true},
    description='CoC list references'},

    -- diagnostics
    {'[g', '<Plug>(coc-diagnostic-prev)', opts = {silent = true},
    description = 'CoC previous diagnostic'},
    {']g', '<Plug>(coc-diagnostic-next)', opts = {silent = true},
    description = 'CoC next diagnostic'},

    -- documentation
    {'K',
    function()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
    end,
    opts = {silent = true},
    description = 'CoC show documentation'},

    -- formatting
    {'<leader>cf',
    {n = '<Plug>(coc-format-selected)', x = '<Plug>(coc-format-selected)'},
    opts = {silent = true},
    description = 'CoC format selected'},

    -- refactoring
    {'<leader>rn', '<Plug>(coc-rename)', opts = {silent = true},
    description = 'CoC rename'},

    -- navigation
    {'<space>a', ':<C-u>CocList diagnostics<cr>',
    opts = {silent = true, nowait = true},
    description = 'CoC show all diagnostics'},
    {'<space>o', ':<C-u>CocList outline<cr>',
    opts = {silent = true, nowait = true},
    description = 'CoC show outline'},

    ---------------------------------------------------------------------------

    -- NERDCommenter
    {'<leader>cl',
    {n = '<Plug>NERDCommenterAlignLeft', x = '<Plug>NERDCommenterAlignLeft'},
    opts = {silent = true},
    description = 'Comment line(s) with delimiters aligned left.'},
    {'<leader>cu',
    {n = '<Plug>NERDCommenterUncomment', x = '<Plug>NERDCommenterUncomment'},
    opts = {silent = true},
    description = 'Uncomment line(s).'},
    {'<leader>cy',
    {n = '<Plug>NERDCommenterYank', x = '<Plug>NERDCommenterYank'},
    opts = {silent = true},
    description = 'Comment line(s) and yank the selection.'},
  },

  autocmds = {
    {'InsertEnter',
      function()
          vim.opt.relativenumber = false
      end,
      description = 'Switch from relative to absolute line numbers'
    },
    {'InsertLeave',
      function()
          vim.opt.relativenumber = true
      end,
      description = 'Switch from absolute to relative line numbers'
    },
    {
        name = 'CocGroup',
        {
            'CursorHold',
            "silent call CocActionAsync('highlight')",
            description = 'Highlight symbol under cursor on CursorHold'
        },
        {
            'FileType',
            "setl formatexpr=CocAction('formatSelected')",
            opts = {pattern = { 'typescript', 'json' }},
            description = 'Setup formatexpr specified filetype(s)'
        },
        {
            'User',
            "call CocActionAsync('showSignatureHelp')",
            opts = {pattern = { 'CocJumpPlaceholder' }},
            description = 'Update signature help on jump placeholder'

        }
    },
  },
  commands = {
    {
      ':Format', "call CocAction('format')",
      description = 'CoC format current buffer',
    },
    {
        ':Fold', "call CocAction('fold', <f-args>)",
        opts = {nargs = '?'},
        description = 'CoC fold current buffer'
    },
    {
        ':OR', 
        "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
        description = 'CoC organize import in current buffer'
    }
  }
})

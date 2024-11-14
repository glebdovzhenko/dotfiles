local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- themes
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'mvllow/modes.nvim',
        tag = 'v0.2.0',
        config = function()
            require('modes').setup()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        init = function()
            require('gitsigns').setup()
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'tokyonight',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = { 'statusline', 'winbar' },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {},
                inactive_sections = {},
                tabline = {
                    lualine_a = { {
                        'buffers',
                        symbols = {
                            modified = ' ●',
                            alternate_file = '',
                            directory = '',
                        },
                    } },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                winbar = {},
                inactive_winbar = {},
                extensions = { 'lazy', 'mason' }
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        init = function()
            require("telescope").load_extension "file_browser"
        end
    },
    {
        "prichrd/netrw.nvim",
        init = function()
            require 'netrw'.setup {
                -- Put your configuration here, or leave the object empty to take the default
                -- configuration.
                icons = {
                    symlink = '', -- Symlink icon (directory and file)
                    directory = '', -- Directory icon
                    file = '', -- File icon
                },
                use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
                mappings = {}, -- Custom key mappings
            }
        end
    },
    {
        'lervag/vimtex',
        init = function()
            vim.g.vimtex_view_method = 'skim'
        end
    },
    {
        'preservim/nerdcommenter',
        init = function()
            vim.g.NERDCreateDefaultMappings = 0
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        init = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "lua", "vim", "vimdoc", "python", "bash", "html", "http" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        'echasnovski/mini.ai',
        version = false,
        init = function()
            require('mini.ai').setup()
        end
    },
    {
        "tris203/precognition.nvim",
        --event = "VeryLazy",
        opts = {
             startVisible = false,
            -- showBlankVirtLine = true,
            -- highlightColor = { link = "Comment" },
            -- hints = {
            --      Caret = { text = "^", prio = 2 },
            --      Dollar = { text = "$", prio = 1 },
            --      MatchingPair = { text = "%", prio = 5 },
            --      Zero = { text = "0", prio = 1 },
            --      w = { text = "w", prio = 10 },
            --      b = { text = "b", prio = 9 },
            --      e = { text = "e", prio = 8 },
            --      W = { text = "W", prio = 7 },
            --      B = { text = "B", prio = 6 },
            --      E = { text = "E", prio = 5 },
            -- },
            -- gutterHints = {
            --     G = { text = "G", prio = 10 },
            --     gg = { text = "gg", prio = 9 },
            --     PrevParagraph = { text = "{", prio = 8 },
            --     NextParagraph = { text = "}", prio = 8 },
            -- },
            -- disabled_fts = {
            --     "startify",
            -- },
        },
    },
    'nvim-tree/nvim-web-devicons',
    'gelguy/wilder.nvim',
    'romgrk/fzy-lua-native',
    'sheerun/vim-polyglot',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
})

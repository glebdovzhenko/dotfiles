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
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
        config = function()
            --vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
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
    --{
    --    'nvim-lualine/lualine.nvim',
    --    dependencies = {
    --        'nvim-tree/nvim-web-devicons',
    --        init = function()
    --            require('lualine').setup {
    --                options = {
    --                    icons_enabled = true,
    --                    --theme = 'gruvbox'
    --                    theme = 'palenight'
    --                }
    --            }
    --        end
    --    }
    --},
    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        init = function()
            require("bufferline").setup {
                options = {
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree",
                            highlight = "Directory",
                            separator = true
                        }
                    },
                    indicator = { icon = ' 󰜮󰜮 ', style = 'icon' }
                }
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
        "akinsho/toggleterm.nvim",
        version = '*',
        init = function()
            require("toggleterm").setup {
                open_mapping = [[<c-\>]],
                insert_mappings = true,
                terminal_mappings = true,
                direction = 'float'
            }
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require('nvim-tree').setup()
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            require("harpoon").setup()
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
    'gelguy/wilder.nvim',
    'romgrk/fzy-lua-native',
    'stevearc/dressing.nvim',
    'sheerun/vim-polyglot',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
})

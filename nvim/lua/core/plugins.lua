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
    'wbthomason/packer.nvim',
    'nvim-tree/nvim-tree.lua',
    'lervag/vimtex',
    'preservim/nerdcommenter',
    'morhetz/gruvbox',
    'gelguy/wilder.nvim',
    'romgrk/fzy-lua-native',
    'lewis6991/gitsigns.nvim',
    'mrjones2014/legendary.nvim',
    'stevearc/dressing.nvim',
    'karb94/neoscroll.nvim',
    'sheerun/vim-polyglot',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
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
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate lua c vim vimdoc query' }
        }
    },
    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        "akinsho/toggleterm.nvim", version = '*'
    }
})

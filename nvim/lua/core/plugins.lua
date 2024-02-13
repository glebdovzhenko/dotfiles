  --use 'wbthomason/packer.nvim'
  --use 'nvim-tree/nvim-tree.lua'
  --use 'lervag/vimtex'
  --use 'preservim/nerdcommenter'
  --use 'morhetz/gruvbox'
  --use 'gelguy/wilder.nvim'
  --use 'romgrk/fzy-lua-native'
  --use 'lewis6991/gitsigns.nvim'
  --use 'mrjones2014/legendary.nvim'
  --use 'stevearc/dressing.nvim'
  --use 'karb94/neoscroll.nvim'
  
  --use {
  --    'neoclide/coc.nvim', 
  --    branch = 'release',
  --    run = ':CocInstall coc-go coc-pyright coc-prettier coc-json coc-lua coc-html coc-html-css-support'
  --}
  --use {
  --    'nvim-lualine/lualine.nvim', 
  --    requires = {
  --        'nvim-tree/nvim-web-devicons', 
  --        {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate lua c vim vimdoc query'}
  --    }
  --}
  --use {
  --    'akinsho/bufferline.nvim', 
  --    tag = "v3.*", 
  --    requires = 'nvim-tree/nvim-web-devicons'
  --}
  --use {
  --    'nvim-telescope/telescope.nvim', 
  --    tag = '0.1.4', 
  --    requires = 'nvim-lua/plenary.nvim'
  --}
  --use {
  --    "akinsho/toggleterm.nvim", tag = '*', 
  --}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
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
  {
      'neoclide/coc.nvim',
      branch = 'release',
      build = ':CocInstall coc-go coc-pyright coc-prettier coc-json coc-lua coc-html coc-html-css-support'
  },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = {
          'nvim-tree/nvim-web-devicons', 
          {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate lua c vim vimdoc query'}
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

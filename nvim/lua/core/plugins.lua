local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'lervag/vimtex'
  use 'preservim/nerdcommenter'
  use 'morhetz/gruvbox'
  use 'gelguy/wilder.nvim'
  use 'romgrk/fzy-lua-native'
  use 'lewis6991/gitsigns.nvim'
  use 'mrjones2014/legendary.nvim'
  use 'stevearc/dressing.nvim'
  use 'karb94/neoscroll.nvim'
  
  use {
      'neoclide/coc.nvim', 
      branch = 'release',
      run = ':CocInstall coc-go coc-pyright coc-prettier coc-json coc-lua coc-html coc-html-css-support'
  }
  use {
      'nvim-lualine/lualine.nvim', 
      requires = {
          'nvim-tree/nvim-web-devicons', 
          {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate lua c vim vimdoc query'}
      }
  }
  use {
      'akinsho/bufferline.nvim', 
      tag = "v3.*", 
      requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.4', 
      requires = 'nvim-lua/plenary.nvim'
  }
  use {
      "akinsho/toggleterm.nvim", tag = '*', 
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)


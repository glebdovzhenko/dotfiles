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
  use {
      'neoclide/coc.nvim', 
      branch = 'release',
      run = ':CocInstall coc-go coc-pyright coc-prettier coc-json'
  }
  use {
      'nvim-lualine/lualine.nvim', 
      requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
      'akinsho/bufferline.nvim', 
      tag = "v3.*", 
      requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
      'nvim-telescope/telescope.nvim', 
      tag = '0.1.1', 
      requires = 'nvim-lua/plenary.nvim'
  }
  use {
       'lewis6991/gitsigns.nvim',
       config = function()
           require('gitsigns').setup()
       end
  }
  use {
      "akinsho/toggleterm.nvim", tag = '*', 
      config = function()
          require("toggleterm").setup()
      end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)


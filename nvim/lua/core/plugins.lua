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
  use 'nvim-tree/nvim-web-devicons'  --optional, for file icons
  use 'nvim-tree/nvim-tree.lua'
  use 'lervag/vimtex'
  use 'vim-airline/vim-airline'
  use 'preservim/nerdcommenter'
  use {
      'junegunn/fzf', 
      run = ':fzf#install()' 
  }
  use 'junegunn/fzf.vim'
  use 'morhetz/gruvbox'
  use {
      'neoclide/coc.nvim', 
      branch = 'release'
  }
  use 'chrisbra/csv.vim'
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
      'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
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


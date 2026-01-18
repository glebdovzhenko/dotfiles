vim.g.netrw_liststyle = 3
vim.g.netrw_fastbrowse = 0
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

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
require('lazy').setup('plugins')

require("keymaps")
require("autocommands")
require('lsp')

--- TODO: add python file formatting via black
--- TODO: see if more plugins can be deleted?

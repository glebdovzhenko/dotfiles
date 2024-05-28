vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

require("core.plugins")

require('core.plugin_config.mason')
require('core.plugin_config.nvim-cmp')
require('core.plugin_config.wilder')

require("core.keymaps")
require("core.autocommands")

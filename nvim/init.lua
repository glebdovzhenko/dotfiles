vim.g.netrw_liststyle = 3
vim.g.netrw_fastbrowse = 0
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

require("core.plugins")

require('core.plugin_config.mason')
require('core.plugin_config.nvim-cmp')
require('core.plugin_config.wilder')

require("core.keymaps")
require("core.autocommands")

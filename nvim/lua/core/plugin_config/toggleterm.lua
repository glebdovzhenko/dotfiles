require("toggleterm").setup()

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _lazygit_toggle()
  lazygit:toggle()
end

--vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", 
--  {noremap = true, silent = true})
--vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=float<CR>')

-- setting Esc as 'leave terminal mode' key
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

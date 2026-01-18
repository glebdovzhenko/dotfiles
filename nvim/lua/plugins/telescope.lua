return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        init = function()
            local actions = require "telescope.actions"
            require("telescope").setup {
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                            }
                        }
                    }
                }
            }
        end
    },

}

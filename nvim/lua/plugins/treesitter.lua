return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        init = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "lua", "vim", "vimdoc", "python", "bash", "html", "http" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },

}

vim.lsp.enable('gopls')
vim.lsp.enable('luals')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('nixd')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Configure LSP keymaps',
    callback = function(args)
        vim.keymap.set('n', 'gD',
            vim.lsp.buf.declaration,
            { buffer = 0, desc = 'Find declaration' })
        vim.keymap.set('n', 'gd',
            vim.lsp.buf.definition,
            { buffer = 0, desc = 'Find definition' })
        vim.keymap.set('n', 'K',
            vim.lsp.buf.hover,
            { buffer = 0, desc = 'Show help' })
        vim.keymap.set('n', '<space>f',
            function()
                vim.lsp.buf.format { async = true }
            end,
            { buffer = 0, desc = 'Format current buffer' }
        )
    end,
})

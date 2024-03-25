require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "pyright", "gopls" },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function set_lsp_mappings()
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
end

local lua_settings = {
    Lua = {
        runtime = { version = 'LuaJIT', },
        diagnostics = { globals = { 'vim', 'require' }, },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), },
        telemetry = { enable = false, },
    },
}

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    settings = lua_settings,
    on_attach = set_lsp_mappings
}
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = set_lsp_mappings
}
require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = set_lsp_mappings
}

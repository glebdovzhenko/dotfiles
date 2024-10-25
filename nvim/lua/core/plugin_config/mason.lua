require("mason").setup()
require("mason-lspconfig").setup {}

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

local function set_black_mapping()
    vim.keymap.set('n', '<space>f',
        function()
            vim.api.nvim_command('write')
            -- put back if I remove the autocommand
            --vim.api.nvim_command('!black %')
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

local nix_settings = {
    nixd = {
        nixpkgs = {
            expr = "import <nixpkgs> { }",
        },
        formatting = {
            command = { "nixpkgs-fmt" }, -- or nixfmt or nixpkgs-fmt
        },
        -- options = {
        --   nixos = {
        --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
        --   },
        --   home_manager = {
        --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
        --   },
        -- },
    },
}


require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    settings = lua_settings,
    on_attach = set_lsp_mappings
}
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = function()
        set_lsp_mappings()
        set_black_mapping()
    end
}
require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = set_lsp_mappings
}
require("lspconfig").nixd.setup {
    capabilities = capabilities,
    cmd = { "nixd" },
    settings = nix_settings,
    on_attach = set_lsp_mappings,

}

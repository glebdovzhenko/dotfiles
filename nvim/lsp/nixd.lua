return {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "nixpkgs-fmt" }, -- or nixfmt or nixpkgs-fmt
            },
        },
    },
}

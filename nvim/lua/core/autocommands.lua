--TODO: descriptions don's seem to work???
vim.api.nvim_create_autocmd('InsertEnter',
    {
        callback = function()
            vim.opt.relativenumber = false
        end,
        desc = 'Switch from relative to absolute line numbers'
    })
vim.api.nvim_create_autocmd('InsertLeave',
    {
        callback = function()
            vim.opt.relativenumber = true
        end,
        desc = 'Switch from absolute to relative line numbers'
    })
vim.api.nvim_create_autocmd('BufWritePost',
    {
        callback = function()
            if vim.bo.filetype == 'python' then
                vim.api.nvim_command('!black %')
            end
        end,
        desc = 'Run black formatter on autosave'
    })

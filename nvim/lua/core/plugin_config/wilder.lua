wilder = require('wilder')

wilder.setup({ modes = { ':', '/', '?' } })


local gradient = {
    '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
    '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
    '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
    '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
    gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu',
        { { a = 1 }, { a = 1 }, { foreground = fg } })
end

-- Fuzzy search
wilder.set_option('pipeline', {
    wilder.branch(
        wilder.python_file_finder_pipeline({
            -- to use ripgrep : {'rg', '--files'}
            -- to use fd      : {'fd', '-tf'}
            -- file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'},
            file_command = { 'fd', '-tf' },
            -- to use fd      : {'fd', '-td'}
            dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
            -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
            -- found at https://github.com/nixprime/cpsm
            filters = { 'fuzzy_filter', 'difflib_sorter' },
        }),
        wilder.cmdline_pipeline(),
        wilder.python_search_pipeline()
    ),
})

-- Popup rendered
wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_palette_theme({
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
        border = 'rounded',
        max_height = '75%',  -- max height of the palette
        min_height = 0,      -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0,         -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        highlighter = wilder.lua_fzy_highlighter(),
        highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 },
                { foreground = '#f4468f' } }),
        },
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
    })
))

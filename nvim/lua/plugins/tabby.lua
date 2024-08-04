return {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    options = {
        nerdfont = true
    },
    config = function ()
        local theme = {
            fill = 'TabLineFill',
            -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
            head = 'TabLine',
            -- current_tab = 'TabLineSel',
            current_tab = { fg = '#F8FBF6', bg = '#eb6f92', style = 'bold' },
            tab = 'TabLine',
            win = 'TabLine',
            tail = 'TabLine',
        }

        require('tabby.tabline').set(function(line)
            return {
                {
                    { '  ', hl = theme.head },
                },
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.tab
                    return {
                        tab.is_current(),
                        tab.number(),
                        tab.name() .. " ",
                        hl = hl,
                        margin = ' ',
                    }
                end),
                line.spacer(),
                hl = theme.fill,
            }
        end)

    end
}

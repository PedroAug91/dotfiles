return {
    'nanozuki/tabby.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    options = {
        nerdfont = true
    },
    config = function ()
        local theme = {
            fill = 'TabLineFill',
            head = 'TabLine',
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
                        tab.name() .. ' ',
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

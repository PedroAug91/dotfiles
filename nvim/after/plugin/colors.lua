require('fluoromachine').setup({
    disable_background = true,
    theme = 'retrowave',
    overrides = {
        ['@type'] = { italic = true, bold = false },
        ['@function'] = { italic = true, bold = false },
        ['@comment'] = { italic = true },
        ['@keyword'] = { italic = false },
        ['@constant'] = { italic = false, bold = false },
        ['@variable'] = { italic = true },
        ['@field'] = { italic = true },
        ['@parameter'] = { italic = true },
   },
   colors = function(_, d)
       return {
           bg = '#190920',
           alt_bg = d('#190920', 20),
           cyan = '#ffffff',
           red = '#ff1e34',
           yellow = '#ff0044',
           orange = '#f38e21',
           pink = '#ffadff',
           purple = '#9544f7',
       }
   end,
})

local g = vim.g
local api = vim.api

function ColorMyPencils(color)

    color = color or "fluoromachine"
    vim.cmd("colorscheme " .. color)

    api.nvim_set_hl(0, "Normal", {bg = "none"})
    api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

end

ColorMyPencils()

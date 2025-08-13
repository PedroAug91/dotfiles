local shown = false

function ToggleTabLine()
    if shown then
        shown = false
        vim.opt.showtabline = 0
    else
        shown = true
        vim.opt.showtabline = 2
    end
end

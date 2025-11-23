function ColorMyPencils(color)
    local colorScheme = color or "rose-pine-moon"
    vim.cmd.colorscheme(colorScheme)
end

return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
        local opts = {
            enable = {
                terminal = true
            },
            styles = {
                bold = true,
                italic = true,
                transparency = true
            }
        }

        require("rose-pine").setup(opts)
        ColorMyPencils()
    end
}


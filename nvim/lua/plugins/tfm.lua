return {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    opts = {
        file_manager = "yazi",
        replace_netrw = true,
        enable_cmds = false,
        keybindings = {
            ["<ESC>"] = "q",
            ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR><CR>",
            ["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR><CR>",
            ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR><CR>",
        },
        -- Customise UI. The below options are the default
        ui = {
            border = "rounded",
            height = 1,
            width = 1,
            x = 0.5,
            y = 0.5,
        },
    },
    keys = {
        {
            "<C-n>",
            function ()
                require("tfm").open()
            end
        }
    }
}

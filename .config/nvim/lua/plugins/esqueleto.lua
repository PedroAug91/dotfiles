return {
    'cvigilv/esqueleto.nvim',
    config = function()
        local opts = {
            directories = {"~/.config/nvim/skeletons/"},
            patterns = {"cpp", "c"},
            autouse = true
        }
        require("esqueleto").setup(opts)
    end
}


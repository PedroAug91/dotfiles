return {
    'cvigilv/esqueleto.nvim',
    config = function()
        require("esqueleto").setup({
            directories = {"~/.config/nvim/skeletons/"},
            patterns = {"cpp", "c"},
            autouse = true
        })
    end
}


return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        keybindings ={
            {"<leader>rm", ":RenderMarkdown toggle<CR>", { desc = "[R]ender [M]arkdown"}}
        }
    }
}

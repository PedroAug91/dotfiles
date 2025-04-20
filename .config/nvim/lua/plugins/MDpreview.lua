return {
    {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    config = function ()
        vim.keymap.set('n', "<leader>rm", ":RenderMarkdown toggle<CR>", { desc = "[R]ender [M]arkdown" })
    end
    },
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     lazy = false,
    --     build = "cd app && yarn install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --         vim.keymap.set('n', "<leader>rm", ":MarkdownPreviewToggle<CR>", { desc = "[R]ender [M]arkdown" })
    --     end,
    --     ft = { "markdown" },
    -- },

}

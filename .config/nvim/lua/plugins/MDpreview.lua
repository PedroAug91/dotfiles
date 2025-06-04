return {
    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    --     ---@module 'render-markdown'
    --     ---@type render.md.UserConfig
    --     config = function ()
    --         vim.keymap.set('n', "<leader>rm", ":RenderMarkdown toggle<CR>", { desc = "[R]ender [M]arkdown" })
    --         require("render-markdown").setup({
    --             code = {
    --                 width = "block",
    --             }
    --         })
    --     end
    -- },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },
}

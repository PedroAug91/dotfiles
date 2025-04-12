return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function ()
                if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                    return
                end

                return "make install_jsregexp"
            end)()
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function ()
        local cmp = require("cmp")

        local luasnip = require("luasnip")
        luasnip.config.setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = {
                { name = "lazydev", group_index = 0 },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = 'lazydev', },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' }
            },
            -- formatting = cmp_format,
            mapping = {
                ["<C-j>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<C-k>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }
        })
    end
}

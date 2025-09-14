return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                    return
                end

                return "make install_jsregexp"
            end)()
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")
        luasnip.config.setup({})

        local window_opts = {
            border = "rounded",
            max_height = 30,
            max_width = 80
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = window_opts,
                documentation = window_opts
            },
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = {
                { name = "lazydev",                group_index = 0 },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "lazydev", },
                { name = "luasnip" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" }
            },
            mapping = {
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            },
            formatting = {
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'λ',
                        luasnip = '⋗',
                        buffer = 'Ω',
                        path = '🖫',
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            }
        })
    end
}

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")

        local window_opts = {
            border = "rounded",
            max_height = 30,
            max_width = 80
        }

        local opts = {
            window = {
                completion = window_opts,
                documentation = window_opts
            },
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = {
                { name = "lazydev", group_index = 0 },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "lazydev", },
                { name = "luasnip" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" }
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            },
            formatting = {
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'λ',
                        buffer = 'Ω',
                        path = '🖫',
                    }

                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            }
        }

        cmp.setup(opts)
    end
}

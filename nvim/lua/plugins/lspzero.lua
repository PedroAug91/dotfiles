return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'L3MON4D3/LuaSnip',
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })

            -- Keymaps
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
            vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = bufnr })
            vim.keymap.set('n', '<leader>nn', function() vim.lsp.buf.rename() end, { buffer = bufnr })
        end)

        lsp_zero.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        local cmp = require("cmp")
        local cmp_format = require("lsp-zero").cmp_format({ details = true })


        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" }
            },
            formatting = cmp_format,
            mapping = {
                ["<C-j>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<C-k>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "cssls",
                "css_variables",
                "docker_compose_language_service",
                "dockerls",
                "emmet_language_server",
                "jinja_lsp",
                "html",
                "intelephense",
                "lua_ls",
                "pyright",
                "sqlls",
                "tsserver"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                intelephense = function ()
                    require("lspconfig").intelephense.setup({
                        filetypes = { "php", "php_only", "blade" }
                    })
                end,
                tsserver = function ()
                    require("lspconfig").tsserver.setup({
                        filetypes = {
                            "javascript", "javascriptreact", "javascript.jsx",
                            "typescript", "typescriptreact", "typescript.tsx",
                            "html", "htmldjango"
                        }
                    })
                end,

                html = function ()
                    require("lspconfig").html.setup({
                        filetypes = {"html", "php", "htmldjango", "blade"}
                    })
                end,

                emmet_language_server = function ()
                    require("lspconfig").emmet_language_server.setup({
                        filetypes = {
                            "css", "eruby", "html", "php",
                            "javascript", "javascriptreact", "less",
                            "sass", "scss", "pug", "typescriptreact",
                            "htmldjango", "blade"
                        },

                    })
                end,

                docker_compose_language_service = function ()
                    require("lspconfig").docker_compose_language_service.setup({
                        filetypes = {
                            "yaml.docker-compose", "yml", "yaml",
                            "docker-compose"
                        }
                    })
                end
            },
        })

    end
}

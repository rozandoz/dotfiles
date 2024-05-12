return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies =
        {
            "williamboman/mason.nvim" ,
            "williamboman/mason-lspconfig.nvim",

            'neovim/nvim-lspconfig',

            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/nvim-cmp',

            'L3MON4D3/LuaSnip',
        },
        config = function ()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason').setup({});
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                },
            })

            local cmp = require('cmp')
            local cmp_format = lsp_zero.cmp_format({
                details = true,
            })

            local function squash_abbr(name)
                -- get rid of C++ namespaces (splitted by "::")
                return name:match(".*::(.*)");
            end

            local my_format = {
                format = function(entry, vim_item)
                    local abbr = squash_abbr(vim_item.abbr);
                    if abbr then
                        vim_item.abbr = abbr;
                        return vim_item;
                    else
                        return cmp_format.format(entry, vim_item);
                    end
                end
            }

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'buffer' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                formatting = vim.tbl_deep_extend("force", cmp_format, my_format),
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end
    },
}

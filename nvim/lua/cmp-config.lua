local function setup()
    local cmp = require("cmp")

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.scroll_docs( -4),
            ["<C-j>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({ select = true })
        }),
        sources = cmp.config.sources({
            { name = "luasnip" }, { name = "crates" }, { name = "path" },
            { name = 'spell' }, { name = "buffer" }, { name = "calc" },
            { name = "crates" }, { name = 'cmp_pandoc' },
            { name = "nvim_lsp_signature_help" }, { name = "nvim_lua" },
            { name = "latex_symbols" }, { name = "nvim_lsp" }, { name = "buffer" }
        })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            { name = "spell" }, { name = "conventionalcommits" }
        }, { { name = "buffer" } })
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } },
            { { name = "cmdline" }, { name = "nvim_lua" } })
    })
end

return { setup = setup }

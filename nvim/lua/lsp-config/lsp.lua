local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { 'vim', 'use' } } } }
    }

    lspconfig.angularls.setup { capabilities = capabilities }

    lspconfig.volar.setup { capabilities = capabilities }

    lspconfig.vuels.setup { capabilities = capabilities }

    lspconfig.astro.setup { capabilities = capabilities }

    lspconfig.svelte.setup { capabilities = capabilities }

    lspconfig.svlangserver.setup { capabilities = capabilities }

    lspconfig.svls.setup { capabilities = capabilities }

    lspconfig.awk_ls.setup { capabilities = capabilities }

    lspconfig.emmet_ls.setup { capabilities = capabilities }

    lspconfig.bashls.setup { capabilities = capabilities }

    lspconfig.clangd.setup { capabilities = capabilities }

    lspconfig.cmake.setup { capabilities = capabilities }

    lspconfig.cssmodules_ls.setup {
        capabilities = capabilities,
        init_options = {
            provideFormatter = true,
            embeddedLanguages = { css = true, javascript = true },
            configurationSection = { "html", "css", "javascript" }

        }
    }

    lspconfig.dockerls.setup { capabilities = capabilities }

    lspconfig.docker_compose_language_service.setup {
        capabilities = capabilities
    }

    lspconfig.ember.setup { capabilities = capabilities }

    lspconfig.eslint.setup { capabilities = capabilities }

    lspconfig.gdscript.setup { capabilities = capabilities }

    lspconfig.gopls.setup { capabilities = capabilities }

    lspconfig.html.setup { capabilities = capabilities }

    lspconfig.jsonls.setup { capabilities = capabilities }

    lspconfig.solang.setup { capabilities = capabilities }

    lspconfig.pyre.setup { capabilities = capabilities }

    lspconfig.pylsp.setup {
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = { ignore = { 'W391' }, maxLineLength = 100 }
                }
            }
        }
    }

    lspconfig.pyright.setup { capabilities = capabilities }

    lspconfig.rust_analyzer.setup { apabilities = capabilities }

    lspconfig.sqlls.setup { capabilities = capabilities }

    lspconfig.stylelint_lsp.setup { capabilities = capabilities }

    lspconfig.tsserver.setup { capabilities = capabilities }

    lspconfig.cssls.setup { capabilities = capabilities }

    lspconfig.prismals.setup { capabilities = capabilities }

    lspconfig.tailwindcss.setup { capabilities = capabilities }

    lspconfig.taplo.setup { capabilities = capabilities }

    lspconfig.zls.setup { capabilities = capabilities }

    lspconfig.vimls.setup { capabilities = capabilities }

    lspconfig.solidity.setup { capabilities = capabilities }

    lspconfig.asm_lsp.setup { capabilities = capabilities }

    lspconfig.quick_lint_js.setup { capabilities = capabilities }

    lspconfig.yamlls.setup { capabilities = capabilities }

    lspconfig.lemminx.setup { capabilities = capabilities }

    lspconfig.texlab.setup {
        filetypes = { "tex", "bib", "markdown", "plaintex" },
        capabilities = capabilities,
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    }
end

return { setup = setup, capabilities = capabilities }

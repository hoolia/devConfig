local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { 'vim', 'use' } } } }
    }

    lspconfig.astro.setup {
        capabilities = capabilities
    }

    lspconfig.gopls.setup {
        capabilities = capabilities,
    }

    lspconfig.eslint.setup {
        capabilities = capabilities
    }

    lspconfig.svelte.setup {
        capabilities = capabilities
    }

    lspconfig.slint_lsp.setup {
        capabilities = capabilities
    }

    lspconfig.svlangserver.setup {
        capabilities = capabilities
    }

    lspconfig.biome.setup {
        capabilities = capabilities
    }

    lspconfig.volar.setup {
        capabilities = capabilities,
        init_options = {
            typescript = {
                tsdk = '/home/flagmate/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib'
            },
        }
    }

    lspconfig.svls.setup {
        capabilities = capabilities
    }

    lspconfig.emmet_ls.setup {
        capabilities = capabilities
    }

    lspconfig.bashls.setup {
        capabilities = capabilities
    }

    lspconfig.clangd.setup {
        capabilities = capabilities,
        cmd = {
            "clangd",
            "--compile-commands-dir=/home/flagmate/.config/nvim/lua/lsp-config/compile_flags.txt",
        }
    }

    lspconfig.cmake.setup {
        capabilities = capabilities
    }

    lspconfig.htmx.setup {
        capabilities = capabilities
    }

    lspconfig.cssmodules_ls.setup {
        capabilities = capabilities,

        init_options = {
            provideFormatter = true,
            embeddedLanguages = { css = true, javascript = true },
            configurationSection = { "html", "css", "javascript" }
        }
    }

    lspconfig.dockerls.setup {
        capabilities = capabilities
    }

    lspconfig.docker_compose_language_service.setup {
        capabilities = capabilities
    }

    lspconfig.gdscript.setup {
        capabilities = capabilities
    }

    lspconfig.html.setup {
        capabilities = capabilities
    }

    lspconfig.jsonls.setup {
        capabilities = capabilities
    }


    lspconfig.pyre.setup {
        capabilities = capabilities
    }

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

    lspconfig.pyright.setup {
        pabilities = capabilities
    }

    lspconfig.rust_analyzer.setup {
        apabilities = capabilities
    }

    lspconfig.sqlls.setup {
        capabilities = capabilities
    }

    lspconfig.tsserver.setup {
        capabilities = capabilities
    }

    lspconfig.cssls.setup {
        capabilities = capabilities
    }

    lspconfig.prismals.setup {
        capabilities = capabilities
    }

    lspconfig.tailwindcss.setup {
        capabilities = capabilities
    }

    lspconfig.taplo.setup {
        capabilities = capabilities
    }

    lspconfig.zls.setup {
        capabilities = capabilities
    }

    lspconfig.solidity.setup {
        capabilities = capabilities
    }

    lspconfig.solidity_ls_nomicfoundation.setup {
        capabilities = capabilities
    }

    lspconfig.asm_lsp.setup {
        capabilities = capabilities
    }

    lspconfig.yamlls.setup {
        capabilities = capabilities
    }

    lspconfig.lemminx.setup {
        capabilities = capabilities
    }

    lspconfig.texlab.setup {
        filetypes = { "tex", "bib", "markdown", "plaintex" },
        capabilities = capabilities,
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    }

    lspconfig.phpactor.setup {
        capabilities = capabilities
    }

    lspconfig.jdtls.setup({
        capabilities = capabilities,
        settings = {
            java = {
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-21",
                            path = "/usr/lib/jvm/java-21-openjdk",
                            default = true,
                        }
                    }
                }
            }
        }
    })

    require("flutter-tools").setup({
        debugger = { enabled = false, },
        outline = { auto_open = false },
        decorations = { statusline = { device = true, app_version = true } },
        widget_guides = { enabled = true, debug = true },
        dev_log = { enabled = false, open_cmd = "tabedit" },
        lsp = {
            color = {
                enabled = true,
                background = false,
                foreground = true,
                background_color = nil,
                virtual_text = true,
                virtual_text_str = "■"
            },
            settings = {
                showTodos = true,
                renameFilesWithClasses = "prompt"
            },
            capabilities = capabilities,
        }
    })
    require("telescope").load_extension("flutter")
end

return { setup = setup }

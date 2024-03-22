local function setup()
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    local null_ls = require("null-ls")
    local h = require("null-ls.helpers")

    local code_actions = null_ls.builtins.code_actions

    -- diagnostic sources
    local diagnostics = null_ls.builtins.diagnostics

    -- formatting sources
    local formatting = null_ls.builtins.formatting

    -- hover sources
    local hover = null_ls.builtins.hover

    -- completion sources
    local completion = null_ls.builtins.completion

    null_ls.setup({
        sources = {
            -- diagnostics  -------------
            diagnostics.gitlint,      --
            diagnostics.shellcheck,   --
            diagnostics.actionlint,   --
            diagnostics.misspell,     --
            diagnostics.hadolint,     --
            diagnostics.eslint,       --
            diagnostics.yamllint,     --
            -- formatting  --------------
            formatting.black,         --
            formatting.cmake_format,  --
            formatting.isort,         --
            formatting.bibclean,      --
            formatting.dart_format,   --
            formatting.rustywind,     --
            formatting.gdformat,      --
            formatting.latexindent,   --
            formatting.cbfmt,         --
            formatting.sql_formatter, --
            formatting.beautysh,      --
            formatting.prettier.with({
                args = h.range_formatting_args_factory({
                    "--stdin-filepath", "$FILENAME", "--tab-width", "4",
                    "--embedded-language-formatting", "auto"
                }, "--range-start", "--range-end", {
                    row_offset = -1,
                    col_offset = -1
                }),
                disabled_filetypes = { "markdown" }
            }),                                                       --
            formatting.deno_fmt.with({ filetypes = { "markdown" } }), --
            formatting.markdown_toc,                                  --
            -- completion  --------------------------------
            completion.tags,                                          --
            completion.spell,                                         --
            -- code_actions  --------------------------------
            code_actions.shellcheck,                                  --
            code_actions.eslint,                                      --
            code_actions.gitrebase,                                   --
            -- hover  --------------------------------
            hover.dictionary,                                         --
            hover.printenv                                            --
        }
    })
end

return { setup = setup }

local function treesitter_setup()
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        auto_install = true,
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = {
            enable = true, -- comment
            enable_autocmd = false
        },
        highlight = {
            enable = true, -- comment
        }
    })
end

local function autopairs_setup()
    require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        check_ts = true,
        ts_config = {
            lua = { "string" }, -- it will not add pair on that treesitter node
            javascript = { "template_string" }
        }
    })
end

return { treesitter_setup = treesitter_setup, autopairs_setup = autopairs_setup }

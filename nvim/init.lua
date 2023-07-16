vim.cmd([[set termguicolors]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local ignored_files = {
    "Cargo.lock", "__pycache__", "node_modules", "packer_compiled.lua",
    "snippets"
}

local function theme_setup()
    require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        dim_inactive = true,
        lualine_bold = true
    })
    vim.cmd([[colorscheme tokyonight]])
end

require("lazy").setup({
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = false,
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "angularls",
                    "volar",
                    "vuels",
                    "astro",
                    "svelte",
                    "svlangserver",
                    "svls",
                    "awk_ls",
                    "emmet_ls",
                    "bashls",
                    "clangd",
                    "cmake",
                    "cssmodules_ls",
                    "dockerls",
                    "docker_compose_language_service",
                    "ember",
                    "eslint",
                    "gopls",
                    "html",
                    "jsonls",
                    "solang",
                    "pyre",
                    "pylsp",
                    "pyright",
                    "rust_analyzer",
                    "sqlls",
                    "stylelint_lsp",
                    "tsserver",
                    "cssls",
                    "prismals",
                    "tailwindcss",
                    "taplo",
                    "zls",
                    "vimls",
                    "solidity",
                    "asm_lsp",
                    "quick_lint_js",
                    "yamlls",
                    "lemminx",
                    "texlab"

                },
            })
        end
    },                                       -- linting
    { "williamboman/mason-lspconfig.nvim" }, --  linting
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        after = "williamboman/mason.nvim",
        config = function() require('lsp-config.lsp').setup() end
    },                                                                                            -- linting
    { "Saecki/crates.nvim",               lazy = false, ft = { "rust", "toml" }, config = true }, -- linting
    {
        'simrat39/rust-tools.nvim',
        lazy = false,
        ft = { "rust", "toml" },
        config = function() require('lsp-config.rusttools').setup() end
    }, -- linting
    {
        'jose-elias-alvarez/null-ls.nvim',
        lazy = false,                                                -- linting
        config = function() require('lsp-config.nulls').setup() end
    },                                                               -- linting
    { 'j-hui/fidget.nvim',            lazy = false, config = true }, -- linting
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        run = ":TSUpdate",
        config = function()
            require('treesitter-config').treesitter_setup()
            require("treesitter-config").autopairs_setup()
            require('refactoring').setup({})
            require('Comment').setup()

            local ft = require('Comment.ft')
            ft.pact = ';; %s'
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",       -- linting
            "windwp/nvim-autopairs",                         -- linting
            'windwp/nvim-ts-autotag',                        -- linting
            { 'ThePrimeagen/refactoring.nvim', lazy = true } -- linting
        }
    },                                                       -- linting
    { "nvim-lua/popup.nvim",          lazy = false },        -- linting
    { "nvim-lua/plenary.nvim",        lazy = false },        -- linting
    { 'kyazdani42/nvim-web-devicons', lazy = true },         -- linting
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        config = function()
            require("telescope-config").setup(ignored_files)
        end
    },                                         -- linting
    { "szw/vim-maximizer",     lazy = false }, -- linting
    {
        "kyazdani42/nvim-tree.lua",
        lazy = false,
        config = function() require("tree-config").setup(ignored_files) end
    }, -- linting
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        config = function() require("git-config").setup() end
    },                                                        -- linting
    { "numToStr/Comment.nvim", lazy = true },                 -- linting
    { 'folke/which-key.nvim',  lazy = false, config = true }, -- linting
    {
        "folke/todo-comments.nvim",
        lazy = false,
        config = function() require("todo-config").setup() end
    }, -- linting
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function() require("line-config").setup() end
    }, -- linting
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function() require("cmp-config").setup() end,
        dependencies = {
            { "hrsh7th/cmp-cmdline",                 lazy = false },                       -- linting
            { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false },                       -- linting
            { "hrsh7th/cmp-git",                     lazy = false, ft = { "gitcommit" } }, -- linting
            { "hrsh7th/cmp-buffer",                  lazy = false },                       -- linting
            {
                'aspeddro/cmp-pandoc.nvim',
                ft = { "pandoc", "markdown", "rmd", "bib" },
                dependencies = { 'nvim-lua/plenary.nvim', 'jbyuki/nabla.nvim' },
                lazy = false,
                config = function()
                    require('cmp_pandoc').setup({
                        filetypes = { "pandoc", "markdown", "bib" },
                        bibliography = {
                            documentation = true,
                            fields = { "type", "title", "author", "year" }
                        },
                        crossref = { documentation = true, enable_nabla = true }
                    })
                end
            },                                                                         -- linting
            { "hrsh7th/cmp-path",                      lazy = false },                 -- linting
            { "hrsh7th/cmp-nvim-lua",                  lazy = false, ft = { "lua" } }, -- linting
            { "hrsh7th/cmp-calc",                      lazy = false },                 -- linting
            { "hrsh7th/cmp-nvim-lsp",                  lazy = false },                 -- linting
            { 'davidsierradz/cmp-conventionalcommits', lazy = true },                  -- linting
            { "f3fora/cmp-spell",                      lazy = false },                 -- linting
            { 'saadparwaiz1/cmp_luasnip',              lazy = false }                  -- linting
        }
    },                                                                                 -- linting
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        ft = { "dart" },
        config = function()
            require("flutter-tools").setup({
                debugger = { enabled = true, run_via_dap = true },
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
                    capabilities = require("lsp-config.lsp").capabilities
                }
            })
            require("telescope").load_extension("flutter")
        end
    }, -- linting
    {
        'L3MON4D3/LuaSnip',
        lazy = false,
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        dependencies = {

            { 'rafamadriz/friendly-snippets', lazy = false }, -- linting
            { 'honza/vim-snippets',           lazy = false }  -- linting
        }
    },                                                        -- linting
    {
        'mfussenegger/nvim-dap',
        lazy = false,
        config = function() require("dap-config").setup() end,
        dependencies = { 'rcarriga/nvim-dap-ui' }
    }, -- linting
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function() theme_setup() end
    }, -- linting
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = function()
            require('git-conflict').setup({
                default_mappings = true,     -- disable buffer local mapping created by this plugin
                default_commands = true,     -- disable commands created by this plugin
                disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
                highlights = {               -- They must have background color, otherwise the default color will be used
                    incoming = 'DiffAdd',
                    current = 'DiffText'
                }
            })
        end
    }, -- linting
    { "github/copilot.vim", cmd = "Copilot", event = "InsertEnter" }
})

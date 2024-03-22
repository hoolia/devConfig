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
    "Cargo.lock", "__pycache__", "node_modules",
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
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" }, --  linting
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "volar",
                    "htmx",
                    "astro",
                    "svelte",
                    "svlangserver",
                    "svls",
                    "bashls",
                    "clangd",
                    "eslint",
                    "cmake",
                    "cssmodules_ls",
                    "jdtls",
                    "dockerls",
                    "docker_compose_language_service",
                    "html",
                    "jsonls",
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
                    "solidity",
                    "solidity_ls_nomicfoundation",
                    "asm_lsp",
                    "yamlls",
                    "lemminx",
                    "texlab"
                },
            })
        end
    },


    {
        "neovim/nvim-lspconfig",
        lazy = true,
        after = "williamboman/mason.nvim",
        config = function() require('lsp-config.lsp').setup() end
    },

    {
        'akinsho/flutter-tools.nvim', ft = { "dart" },
    },

    { "Saecki/crates.nvim",    ft = { "rust", "toml" }, config = true },

    {
        'simrat39/rust-tools.nvim',
        ft = { "rust", "toml" },
        config = function() require('lsp-config.rusttools').setup() end
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require('lsp-config.nullls').setup() end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('treesitter-config').treesitter_setup()
            require("treesitter-config").autopairs_setup()
            require('refactoring').setup({})
            require('Comment').setup()
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-autopairs",
    'windwp/nvim-ts-autotag',

    {
        "ThePrimeagen/refactoring.nvim",
        ft = {
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
            "lua",
            "c", "cpp",
            "python",
            "java",
            "php",
            "ruby",
        },
        config = function()
            require("refactoring").setup()
        end,
    },

    {
        "nvim-telescope/telescope.nvim",

        config = function()
            require("telescope-config").setup(ignored_files)
        end
    },

    { "nvim-lua/popup.nvim", },
    { "nvim-lua/plenary.nvim", },
    { "szw/vim-maximizer" },

    {
        "kyazdani42/nvim-tree.lua",
        config = function() require("tree-config").setup(ignored_files) end
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
        },
        config = true
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        config = function() require("git-config").setup() end
    },

    { "numToStr/Comment.nvim", lazy = true },

    { 'folke/which-key.nvim',  config = true },

    {
        "folke/todo-comments.nvim",
        config = function() require("todo-config").setup() end
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function() require("line-config").setup() end,
    },

    {
        "hrsh7th/nvim-cmp",
        config = function() require("cmp-config").setup() end,
        dependencies = {
            { "hrsh7th/cmp-cmdline", },
            { "hrsh7th/cmp-nvim-lsp-signature-help", },
            { "hrsh7th/cmp-git", },
            { "hrsh7th/cmp-buffer", },
            {
                'aspeddro/cmp-pandoc.nvim',
                ft = { "pandoc", "markdown", "rmd", "bib" },
            },
            {
                "jc-doyle/cmp-pandoc-references",
                ft = { "pandoc", "markdown", "rmd", "bib" },
            },
            { "hrsh7th/cmp-path", },
            { "hrsh7th/cmp-nvim-lua",                  ft = { "lua" } },
            { "hrsh7th/cmp-calc", },
            { "hrsh7th/cmp-nvim-lsp", },
            { 'davidsierradz/cmp-conventionalcommits', },
            { 'saadparwaiz1/cmp_luasnip', }
        }
    },
    { 'jbyuki/nabla.nvim' },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        dependencies = {
            { 'rafamadriz/friendly-snippets', },
            { 'honza/vim-snippets', }
        }
    },


    {
        "folke/tokyonight.nvim",
        config = function() theme_setup() end,
    },

    { 'kyazdani42/nvim-web-devicons', lazy = true },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup {
                render = 'background',
                enable_named_colors = true,
                enable_tailwind = true,
            }
        end
    },
    {
        'ThePrimeagen/git-worktree.nvim',
        config = function()
            require("git-worktree").setup({})
            require("telescope").load_extension("git_worktree")
        end
    },
    { 'j-hui/fidget.nvim', opts = {} },
    'wakatime/vim-wakatime',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
            require('lsp-config.dap').setup()
        end
    },
})

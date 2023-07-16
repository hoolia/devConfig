local telescope = require('telescope.builtin')
local gs = require('gitsigns')

local vim_diagnostic = vim.diagnostic
local vim_lsp = vim.lsp.buf
local keymap_set = vim.keymap.set

vim.g.mapleader = ' '

-- basic
keymap_set('n', '<Leader>s', ':write<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>Q', ':quitall<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>q', ':bdelete<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>u', '<cmd>m .+1<cr>==', { noremap = true, silent = true })
keymap_set('n', '<leader>i', '<cmd>m .-2<cr>==', { noremap = true, silent = true })
keymap_set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })

-- movements
keymap_set('n', 'j', 'gj')
keymap_set('n', 'k', 'gk')

keymap_set('n', '<m-k>', '<C-w>k', { noremap = true, silent = true })
keymap_set('n', '<m-j>', '<C-w>j', { noremap = true, silent = true })
keymap_set('n', '<m-l>', '<C-w>l', { noremap = true, silent = true })
keymap_set('n', '<m-h>', '<C-w>h', { noremap = true, silent = true })

keymap_set('n', '<m-K>', '<CMD>resize +2<CR>', { silent = true })
keymap_set('n', '<m-J>', '<CMD>resize -2<CR>', { silent = true })
keymap_set('n', '<m-L>', '<CMD>vertical resize -2<CR>', { silent = true })
keymap_set('n', '<m-H>', '<CMD>vertical resize +2<CR>', { silent = true })

keymap_set('n', '<leader>n', ':NvimTreeToggle<CR>',
    { noremap = true, silent = true })
keymap_set('n', 'Y', 'y$', { noremap = true, silent = true })
keymap_set('n', 'n', 'nzzzv', { noremap = true, silent = true })
keymap_set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
keymap_set('n', '<leader>a', '<cmd>MaximizerToggle<CR>',
    { noremap = true, silent = true })

keymap_set('v', '<leader>cf', ":'<,'>fold<CR>", { noremap = true, silent = true })
keymap_set('n', '<leader>co', ':foldopen<CR>', { noremap = true, silent = true })
keymap_set('n', '<leader>cc', ':foldclose<CR>', { noremap = true, silent = true })

keymap_set('t', '<c-t>', '<C-\\><C-n>', { noremap = true, silent = true })

keymap_set('n', '<leader>ff', function() telescope.find_files() end,
    { noremap = true, silent = true, desc = "find files" })

keymap_set('n', '<leader>fg', function() telescope.live_grep() end,
    { noremap = true, silent = true, desc = "grep files" })

keymap_set('n', '<leader>fb', function() telescope.buffers() end,
    { noremap = true, silent = true, desc = "find buffers" })

keymap_set('n', '<leader>fx', function() telescope.colorscheme() end,
    { noremap = true, silent = true, desc = "find colorscheme" })

keymap_set('n', '<leader>fc',
    function() telescope.current_buffer_fuzzy_find() end,
    { noremap = true, silent = true, desc = "fzf current buffer" })

keymap_set('n', '<leader>fh', function() telescope.help_tags() end,
    { noremap = true, silent = true, desc = "help tags" })

keymap_set('n', '<leader>fm', function() telescope.man_pages() end,
    { noremap = true, silent = true, desc = "man pages" })

keymap_set('n', '<leader>fs', function() telescope.commands() end,
    { noremap = true, silent = true, desc = "commands" })

keymap_set('n', '<leader>fa', function() telescope.treesitter() end,
    { noremap = true, silent = true, desc = "treesitter" })

keymap_set('n', '<leader>fl',
    function() telescope.lsp_dynamic_workspace_symbols() end,
    { noremap = true, silent = true, desc = "lsp workspace symbols" })

keymap_set('n', '<leader>fd', function() telescope.diagnostics() end,
    { noremap = true, silent = true, desc = "lsp diagnostics" })

keymap_set('n', '<leader>ft', ":TodoTelescope<CR>",
    { noremap = true, silent = true, desc = "TodoTelescope" })

keymap_set({ 'v', 'n' }, '<leader>l', function() vim_lsp.format() end,
    { noremap = true, silent = true, desc = "lint buffer" })

keymap_set('n', '<leader>gd', function() vim_lsp.definition() end,
    { noremap = true, silent = true, desc = "go to definition" })

keymap_set('n', '<leader>gD', function() vim_lsp.declaration() end,
    { noremap = true, silent = true, desc = "go to declaration" })

keymap_set('n', '<leader>gh', function() vim_lsp.hover() end,
    { noremap = true, silent = true, desc = "lsp hover" })

keymap_set({ 'n', 'v' }, '<leader>gc', function() vim_lsp.code_action() end,
    { noremap = true, silent = true, desc = "lsp code action" })

keymap_set('n', '<leader>gs', function() vim_lsp.signature_help() end,
    { noremap = true, silent = true, desc = "lsp signature help" })

keymap_set('n', '<leader>gl', function() vim_diagnostic.open_float() end,
    { noremap = true, silent = true, desc = "line diagnostic" })

keymap_set('n', '<leader>gp', function() vim_diagnostic.goto_prev() end,
    { noremap = true, silent = true, desc = "previous diagnostic" })

keymap_set('n', '<leader>gn', function() vim_diagnostic.goto_next() end,
    { noremap = true, silent = true, desc = "next diagnostic" })

keymap_set('n', '<leader>gr', function() vim_lsp.rename() end,
    { noremap = true, silent = true, desc = "lsp rename" })

keymap_set('n', '<leader>gt', function() vim_lsp.type_definition() end,
    { noremap = true, silent = true, desc = "lsp type definition" })

keymap_set('n', '<leader>tn', '<cmd>Gitsigns next_hunk<CR>',
    { noremap = true, silent = true })
keymap_set('n', '<leader>tp', '<cmd>Gitsigns prev_hunk<CR>',
    { noremap = true, silent = true })
keymap_set('n', '<leader>tr', '<cmd>Gitsigns reset_hunk<CR>',
    { noremap = true, silent = true })
keymap_set('n', '<leader>ts', '<cmd>Gitsigns stage_hunk<CR>',
    { noremap = true, silent = true })
keymap_set('n', '<leader>tv', '<cmd>Gitsigns select_hunk<CR>',
    { noremap = true, silent = true })

keymap_set('n', '<leader>th', function() gs.preview_hunk() end,
    { noremap = true, silent = true, desc = "preview hunk" })

keymap_set('n', '<leader>tD', function() gs.toggle_deleted() end,
    { noremap = true, silent = true, desc = "gitsigns toggle deleted" })

keymap_set('n', '<leader>td', function() gs.diffthis() end,
    { noremap = true, silent = true, desc = "diff this" })

keymap_set('n', '<leader>tu', function() gs.undo_stage_hunk() end,
    { noremap = true, silent = true, desc = "undo stage hunk" })

keymap_set('n', '<leader>tbs', function() gs.stage_buffer() end,
    { noremap = true, silent = true, desc = "stage buffer" })

keymap_set('n', '<leader>tbr', function() gs.reset_buffer() end,
    { noremap = true, silent = true, desc = "reset buffer" })

-- refactoring
keymap_set("v", "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Function"
    })

keymap_set("v", "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Function To File"
    })

keymap_set("v", "<leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Variable"
    })

keymap_set("v", "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Inline Variable"
    })

-- Extract block doesn't need visual mode
keymap_set("n", "<leader>rbb",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {
        noremap = true,
        silent = true,
        expr = false,
        desc = 'Extract Block'
    })

keymap_set("n", "<leader>rbf",
    [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Extract Block To File"
    })

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
keymap_set("n", "<leader>ri",
    [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    {
        noremap = true,
        silent = true,
        expr = false,
        desc = "Inline Variable"
    })

keymap_set('n', '<leader>db', function() require 'dap'.toggle_breakpoint() end,
    { noremap = true, silent = true, desc = "toggle breakpoint" })

keymap_set('n', '<leader>dc', function() require 'dap'.continue() end,
    { noremap = true, silent = true, desc = "continue execution" })

keymap_set('n', '<leader>di', function() require 'dap'.step_into() end,
    { noremap = true, silent = true, desc = "step into" })

keymap_set('n', '<leader>do', function() require 'dap'.step_over() end,
    { noremap = true, silent = true, desc = "step over" })

keymap_set('n', '<leader>du', function() require 'dap'.step_out() end,
    { noremap = true, silent = true, desc = "step out" })

keymap_set('n', '<leader>dd', function() require("dapui").toggle() end,
    { noremap = true, silent = true, desc = "dapui" })

keymap_set('n', '<leader>dt', function() require("dap").terminate() end,
    { noremap = true, silent = true, desc = "terminate" })

-- unnamed clipboard
keymap_set({ 'n', 'v' }, '\\', "\"+",
    { noremap = true, silent = true, desc = "terminate" })

local o = vim.o
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

o.syntax = "true"
o.termguicolors = true
o.foldmethod = "marker"
o.fmr = "{{{,}}}"
o.fdl = 0
o.splitbelow = true
o.splitright = true
o.hlsearch = false
o.history = 10000
o.scrolloff = 8
vim.opt.isfname:append("@-@")
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.undodir = os.getenv("HOME") .. "/.vim/undo"
o.updatetime = 50
o.textwidth = 100
o.shiftwidth = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.title = true
o.nu = true
o.relativenumber = true
o.winbar = "%n %m%f %r%h%w"
o.mouse = ""

opt.shortmess:append("c")
opt.termguicolors = true

g.do_filetype_lua = 1
g.did_load_filetypes = 0
g.smartcase = true
g.ttyfast = true
g.bs = 2
g.autoread = true
g.concealcursor = "vin"
g.conceallevel = 0
g.nocompatible = true
g.autoindent = true
g.hidden = true
g.noerrorbells = true
g.wrap = true
g.linebreak = true
g.indentexpr = ''
g.formatoptions = 'tqlnwa'
g.spellfile = os.getenv("HOME") .. "/.config/nvim/spell/en.utf-8.add"

cmd("highlight WinSeparator guibg=None")

if g.neovide then
    vim.o.guifont = "DejaVuSansMono Nerd Font Mono:h11"
    g.neovide_cursor_trail_length = 1
    g.neovide_cursor_vfx_mode = "pixiedust"
    g.neovide_transparency = 0.8
else
    cmd("highlight Visual ctermfg=white guifg=white")
end

vim.g.markdown_fenced_languages = { "ts=typescript" }

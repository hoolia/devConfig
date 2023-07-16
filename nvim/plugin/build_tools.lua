local keymap_set = vim.keymap.set
vim.g.mapleader = ' '

-- terminal
keymap_set('n', '<leader>pt', '<cmd>terminal zsh<CR>i',
           {noremap = true, silent = true})

-- gcc / Clang
keymap_set('n', '<leader>pr', '<cmd>terminal gcc % && ./a.out && rm a.out<CR>i',
           {noremap = true, silent = true})

-- make `makefiles`
keymap_set('n', '<leader>pmm', '<cmd>terminal make<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pmr', '<cmd>terminal make run<CR>i',
           {noremap = true, silent = true})

-- rust
keymap_set('n', '<leader>pcr', '<cmd>terminal RUST_BACKTRACE=1 cargo run<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pcc', '<cmd>terminal cargo clippy<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pcd', '<cmd>terminal cargo doc --open<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pct', '<cmd>terminal cargo test --all<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pcl', '<cmd>terminal cargo test --lib<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pcb', '<cmd>terminal cargo build<CR>i',
           {noremap = true, silent = true})

-- python
keymap_set('n', '<leader>ppr', '<cmd>terminal python %<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>ppt', '<cmd>terminal pytest %<CR>i',
           {noremap = true, silent = true})

-- nodejs
keymap_set('n', '<leader>pyb', '<cmd>terminal yarn build<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pys', '<cmd>terminal yarn start<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pyd', '<cmd>terminal yarn dev<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pn', '<cmd>terminal node %<CR>i',
           {noremap = true, silent = true})

keymap_set('n', '<leader>pjr', '<cmd>terminal gradle run<CR>i',
           {noremap = true, silent = true})
keymap_set('n', '<leader>pjt', '<cmd>terminal gradle test<CR>i',
           {noremap = true, silent = true})

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

vim.keymap.set('n',"<C-t>",":tabnext<CR>")
vim.keymap.set('n',"<C-d>","<C-d>zz")
vim.keymap.set('n',"<C-u>","<C-u>zz")
--vim.keymap.set('n',"<leader>p","\"_dp")

---@diagnostic disable: undefined-global

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Make tab 4 spaces
vim.opt.tabstop = 4           -- Visual width of tab
vim.opt.softtabstop = 4       -- No. of spaces tab counts
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.winborder = "rounded" -- Rounded borders
vim.opt.expandtab = true      -- Turns tabs into spaces

vim.opt.confirm = true
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>so', ':w <CR> <Cmd>update<CR> :source /home/lara/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>qq', ':q<CR>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Plugins ====================================================================
local gh = "https://github.com/"
vim.pack.add({
    gh .. 'nvim-mini/mini.extra',
    gh .. 'nvim-mini/mini.surround',
    gh .. 'nvim-mini/mini.pick',
    gh .. 'nvim-mini/mini.ai',
    gh .. 'folke/flash.nvim',
    gh .. 'stevearc/oil.nvim',
    gh .. 'RRethy/base16-nvim',
    gh .. 'neovim/nvim-lspconfig',
    gh .. 'Mofiqul/adwaita.nvim'
})

-- LSPs
vim.lsp.enable({ 'lua_ls', 'clangd', 'pyright', 'bashls' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Colorscheme
vim.cmd("colorscheme base16-arroz-con-dulce-dark")
-- vim.cmd("colorscheme adwaita")

require("oil").setup()               -- File explorer
require("mini.pick").setup()         -- Picker

require("mini.surround").setup()
require("mini.extra").setup()
require("mini.ai").setup()
vim.keymap.set('n', '<leader><leader>', '<Cmd>Pick buffers<CR>')
vim.keymap.set('n', '<leader>ff', '<Cmd>Pick files<CR>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>f.', '<Cmd>Pick oldfiles<CR>')
vim.keymap.set('n', '<leader>fh', '<Cmd>Pick help<CR>')
vim.keymap.set('n', '<leader>gi', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')

vim.keymap.set('n', '<leader>s', '<cmd>lua require("flash").jump()<cr>')
vim.keymap.set('n', '\'', '<cmd>lua require("flash").jump()<cr>')

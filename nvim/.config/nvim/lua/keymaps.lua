vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local opts = { noremap = true, silent = true }

map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- buffer navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- NvimTree
map("n", "<C-n>", ":NvimTreeFindFile", opts)

-- yank to and paste from clipboard
map({ "n", "v" }, "<leader>y", '"+y', { silent = true })
map("n", "<leader>p", '"+p', opts)
map("i", "<C-v>", '<C-o>"+p', opts)

-- hold on to "clipboard"
map("v", "p", '"_dP', opts)

-- better wrap navigation
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffer navigation
map("n", "<up>", ":wincmd k<CR>", opts)
map("n", "<down>", ":wincmd j<CR>", opts)
map("n", "<left>", ":wincmd h<CR>", opts)
map("n", "<right>", ":wincmd l<CR>", opts)

-- create newline with same leading WORD, like formatoptions += o
map("n", "<leader>o", '0yWo<esc>d"0p', opts)
map("n", "<leader>O", '0yWO<esc>d"0p', opts)

-- move view (maybe get used to c-e and c-y? no)
map("n", "<leader>J", "<C-E>")
map("n", "<leader>K", "<C-Y>")

-- Move text up and down
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- split sentences
map("n", "<leader>.", ":%s/\\s\\+$//e<CR>:%s/\\.\\s\\+/.\\r/eg<CR>:nohlsearch<CR>", opts)

-- word count
map("v", "<leader>wc", ":'<,'>:w !wc<CR>", opts)
map("n", "<leader>wc", ":%:w !wc<CR>", opts)

-- remove whitespace (keymap is overwritten by formatter depending on filetype)
-- map("n", "<leader>ø", ":%s/\\s\\+$//e<CR>:nohlsearch<CR>", opts)

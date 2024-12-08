vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local opts = { noremap = true, silent = true }

map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- visual
map('n', '<leader>z', ':lua vim.cmd("colorscheme kanagawa-wave")<CR>', opts)
map('n', '<leader>x', ':lua vim.cmd("colorscheme kanagawa-dragon")<CR>', opts)
map('n', '<leader>c', ':lua vim.cmd("colorscheme kanagawa-lotus")<CR>', opts)

-- buffer navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- NvimTree
map("n", "<C-n>", ":NvimTreeFindFile", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)

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

-- buffers
map('n', '<leader>tt', ':belowright split | terminal<CR>')
map('n', '<leader>tt', ': | terminal<CR>')

-- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- remove whitespace (keymap is overwritten by formatter depending on filetype)
-- map("n", "<leader>ø", ":%s/\\s\\+$//e<CR>:nohlsearch<CR>", opts)

-- greek letters
local greek_letters = {
	["\\alpha"] = "α", ["\\Alpha"] = "Α",
    ["\\beta"] = "β", ["\\Beta"] = "Β",
    ["\\gamma"] = "γ", ["\\Gamma"] = "Γ",
    ["\\delta"] = "δ", ["\\Delta"] = "Δ",
    ["\\epsilon"] = "ε", ["\\Epsilon"] = "Ε",
    ["\\zeta"] = "ζ", ["\\Zeta"] = "Ζ",
    ["\\eta"] = "η", ["\\Eta"] = "Η",
    ["\\theta"] = "θ", ["\\Theta"] = "Θ",
    ["\\iota"] = "ι", ["\\Iota"] = "Ι",
    ["\\kappa"] = "κ", ["\\Kappa"] = "Κ",
    ["\\lambda"] = "λ", ["\\Lambda"] = "Λ",
    ["\\mu"] = "μ", ["\\Mu"] = "Μ",
    ["\\nu"] = "ν", ["\\Nu"] = "Ν",
    ["\\xi"] = "ξ", ["\\Xi"] = "Ξ",
    ["\\omicron"] = "ο", ["\\Omicron"] = "Ο",
    ["\\pi"] = "π", ["\\Pi"] = "Π",
    ["\\rho"] = "ρ", ["\\Rho"] = "Ρ",
    ["\\sigma"] = "σ", ["\\Sigma"] = "Σ",
    ["\\tau"] = "τ", ["\\Tau"] = "Τ",
    ["\\upsilon"] = "υ", ["\\Upsilon"] = "Υ",
    ["\\phi"] = "φ", ["\\Phi"] = "Φ",
    ["\\chi"] = "χ", ["\\Chi"] = "Χ",
    ["\\psi"] = "ψ", ["\\Psi"] = "Ψ",
    ["\\omega"] = "ω", ["\\Omega"] = "Ω"
}

for key, value in pairs(greek_letters) do
    vim.keymap.set('i', key, value, { noremap = true, silent = true })
end

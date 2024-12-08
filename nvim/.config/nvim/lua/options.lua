local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_augroup('Git', {})

-- searching
opt.ignorecase = true
opt.smartcase = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4

-- ui
opt.number = true
opt.relativenumber = true
opt.showmode = false

-- misc
opt.mouse = "vn"
opt.termguicolors = true
opt.linebreak = true
opt.scrolloff = 3
opt.conceallevel = 2
opt.concealcursor = "v"
opt.virtualedit = "block"
opt.cursorline = true

-- autosave text files
autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = { "*.norg", "*.md", "*.txt" },
	command = "silent write",
})

-- options for git commit buffers
autocmd({ "BufAdd", "VimEnter" }, {
	pattern = { "COMMIT_EDITMSG" },
	callback = function()
		vim.bo.textwidth = 72
		vim.wo.colorcolumn = "+0"
		vim.cmd("startinsert")
	end,
	group = "Git",
})

-- color
vim.cmd.colorscheme("catppuccin")
vim.cmd([[set termguicolors]])

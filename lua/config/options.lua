------------------------------------------------------------
-- Options
------------------------------------------------------------

local indent = 2

-- Enable auto format
vim.g.autoformat = true

--cursor
vim.opt.guicursor = "n-v-i-c:block-Cursor"
-- Interface
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10

vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Search
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = indent
vim.opt.smartindent = true
vim.opt.softtabstop = indent
vim.opt.tabstop = indent

-- Behavior
vim.opt.clipboard = "unnamedplus"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Completion
vim.opt.pumheight = 10

vim.opt.laststatus = 3

vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }

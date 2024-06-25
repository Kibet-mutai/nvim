------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------
local opts = { noremap = true, silent = true }

-- Set leader keys
vim.g.mapleader = " "

vim.keymap.set({ "i", "n" }, "<esc>", "<nop>", { noremap = true })
vim.keymap.set("i", "jj", "<esc>", { noremap = true })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { noremap = true, silent = true, desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { noremap = true, silent = true, desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move up" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Delete a word backwards
--vimkeymap.set("n", "dw", "vb_d")

-- Select all
vim.keymap.set("n", "<Leader>a", "ggVG")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

--tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

--format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

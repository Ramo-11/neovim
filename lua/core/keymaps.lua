vim.g.mapleader = " "

local km = vim.keymap

-- general
km.set("n", "<leader>nh", ":nohl<CR>")
km.set("n", "dw", "diw")
km.set("v", "w", "iw")

-- windows
km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>se", "<C-w>=") -- make split windows equal in width
km.set("n", "<leader>sx", ":close<CR>") -- close current split window
km.set("n", "<leader>w", "<C-w>w") -- go to the next window

km.set("n", "<leader>d", "<C-d>zz")
km.set("n", "<leader>u", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- plugins
-- nvim-tree
km.set("n", "<leader>t", ":NvimTreeToggle<CR>")

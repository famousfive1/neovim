-- ~/.config/nvim-new/plugin/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
vim.keymap.set("n", "n", "nzz") -- Scroll up and center the cursor
vim.keymap.set("n", "N", "Nzz") -- Scroll up and center the cursor
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode

vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "Close Window" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from Sys Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to Sys Clipboard" })

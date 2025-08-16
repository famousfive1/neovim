-- ~/.config/nvim-new/plugin/keymaps.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor
vim.keymap.set("v", "<Leader>p", '"_dP', { desc = "Paste without overwriting the default register" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode

vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Definition" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open [D]iagnostic Float" })

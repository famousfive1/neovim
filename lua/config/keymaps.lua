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
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })
vim.keymap.set("n", "<leader>D", vim.diagnostic.setloclist, { desc = "Open Diagnostic Quickfix List" })
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { nowait = true, desc = "References" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>gs", vim.lsp.buf.document_symbol, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>gS", vim.lsp.buf.workspace_symbol, { desc = "LSP Workspace Symbols" })

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from Sys Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to Sys Clipboard" })

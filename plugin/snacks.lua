vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require('snacks').setup({
    bigfile = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    notifier = {
        enabled = true,
        timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
})

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })

-- search
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.files() end, { desc = "Files" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>st", function() Snacks.picker.colorschemes() end, { desc = "Themes" })

-- LSP
vim.keymap.set("n", "grd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "grD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end, { nowait = true,  desc = "References" })
vim.keymap.set("n", "gri", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gry", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "grs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "grS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Bufdelete
vim.keymap.set("n", "<leader>q", Snacks.bufdelete.delete, { desc = "Close Window" })

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require('snacks').setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = false },
    notifier = {
        enabled = true,
        timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    styles = {
        notification = {
            -- wo = { wrap = true } -- Wrap notifications
        }
    }
})

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>'", function() Snacks.picker.notifications() end, { desc = "Notification History" })

-- search
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.files() end, { desc = "Files" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>st", function() Snacks.picker.colorschemes() end, { desc = "Themes" })

-- LSP
vim.keymap.set("n", "grd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "grD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end, { nowait = true,  desc = "References" })
vim.keymap.set("n", "gri", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gry", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "grs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "grS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Other
vim.keymap.set("n", "<leader>.",  function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<c-/>",      function() Snacks.terminal() end, { desc = "Toggle Terminal" })

vim.g.snacks_animate = false

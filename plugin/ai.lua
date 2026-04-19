vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/gutsavgupta/nvim-gemini-companion"
})
require("gemini").setup()
vim.keymap.set("n", "<leader>gg", "<cmd>GeminiToggle<cr>", { desc = "Toggle Gemini sidebar" })
vim.keymap.set("n", "<leader>gc", "<cmd>GeminiSwitchToCli<cr>", { desc = "Spawn or switch to AI session" })
vim.keymap.set("x", "<leader>gS", "<cmd>GeminiSend<cr>", { desc = "Send selection to Gemini" })

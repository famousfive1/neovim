vim.pack.add({
    "https://github.com/NMAC427/guess-indent.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/folke/flash.nvim"
})

vim.keymap.set("n", "<leader>g", require("gitsigns").preview_hunk_inline, { desc = "Preview Hunk Inline" })

require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

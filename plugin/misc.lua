vim.pack.add({
        "https://github.com/NMAC427/guess-indent.nvim",
        "https://github.com/lewis6991/gitsigns.nvim",
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/nvim-lualine/lualine.nvim",
        "https://github.com/folke/flash.nvim"
})

require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

require("lualine").setup()

require("flash").setup()
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

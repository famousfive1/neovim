vim.pack.add({
    { src = "nhttps://github.com/vim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" }
})

require("harpoon").setup()

vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon Add" })
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<C-1>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<C-2>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<C-3>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<C-4>", function() require("harpoon"):list():select(4) end)
vim.keymap.set("n", "<C-5>", function() require("harpoon"):list():select(5) end)
vim.keymap.set("n", "<C-6>", function() require("harpoon"):list():select(6) end)
vim.keymap.set("n", "<C-7>", function() require("harpoon"):list():select(7) end)
vim.keymap.set("n", "<C-8>", function() require("harpoon"):list():select(8) end)
vim.keymap.set("n", "<C-9>", function() require("harpoon"):list():select(9) end)
vim.keymap.set("n", "<C-0>", function() require("harpoon"):list():select(10) end)

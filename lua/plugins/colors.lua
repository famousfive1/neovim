return {
    { "catppuccin/nvim", lazy = true, name = "catppuccin" },

    { "folke/tokyonight.nvim", lazy = true },

    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
}

return {
    { "catppuccin/nvim", name = "catppuccin" },

    { "folke/tokyonight.nvim" },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
}

return {
    "echasnovski/mini.nvim",
    event = "VimEnter",
    config = function()
        require("mini.ai").setup({ n_lines = 500 })
        require('mini.pairs').setup()
        require('mini.icons').setup()
        require('mini.move').setup()
    end,
}

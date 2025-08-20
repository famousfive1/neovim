return {
    "echasnovski/mini.nvim",
    event = "VimEnter",
    config = function()
        require("mini.ai").setup({ n_lines = 500 })
        require('mini.pairs').setup()
        require('mini.icons').setup()
        require('mini.move').setup()
        -- require('mini.statusline').setup()

        local map_multistep = require('mini.keymap').map_multistep
        map_multistep('i', '<Tab>',   { 'pmenu_next' })
        map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
        map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
        map_multistep('i', '<BS>',    { 'minipairs_bs' })
    end,
}

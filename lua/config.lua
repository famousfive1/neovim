if vim.g.neovide then
    vim.o.guifont = "Hasklug Nerd Font:h14"
    vim.g.neovide_cursor_animation_length = 0
end

vim.g.have_nerd_font = true

vim.opt.guicursor = "i:block" -- Use block cursor in insert mode
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true
vim.opt.swapfile = false -- Disable swap files
vim.opt.autoindent = true -- Enable auto indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces for a tab
vim.opt.softtabstop = 4 -- Number of spaces for a tab when editing
vim.opt.shiftwidth = 4 -- Number of spaces for autoindent
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = false -- Disable line wrapping
vim.opt.cursorline = true -- Highlight the current line
vim.opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
vim.opt.inccommand = "split" -- Shows the effects of a command incrementally in the buffer
vim.opt.undofile = true -- Enable persistent undo
vim.opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
vim.opt.hlsearch = false -- Disable highlighting of search results
vim.opt.mouse = "a"
vim.opt.confirm = true
vim.opt.winborder = "rounded"

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
    group = highlight_group,
})

-- vim: ts=2 sts=2 sw=2 et

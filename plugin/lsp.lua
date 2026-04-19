vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/mason-org/mason.nvim",
})

require("fidget").setup()
require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})
require("mason").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
vim.lsp.enable("vtsls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set("i", "<C-n>", function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

-- Diagnostics
-- vim.diagnostic.config({
--     virtual_lines = true,
--     virtual_text = true,
-- })

-- return {
--
--     {
--         "https://github.com/nvim-treesitter/nvim-treesitter",
--         event = "BufEnter",
--         build = ":TSUpdate",
--         main = "nvim-treesitter.configs", -- Sets main module to use for opts
--         opts = {
--             -- Autoinstall languages that are not installed
--             auto_install = true,
--             highlight = {
--                 enable = true,
--                 additional_vim_regex_highlighting = { "ruby" },
--             },
--             indent = { enable = true, disable = { "ruby" } },
--         },
--     },
--
--     {
--         'https://github.com/saghen/blink.cmp',
--         dependencies = { 'rafamadriz/friendly-snippets' },
--         version = '1.*',
--         event = "LspAttach",
--
--         ---@module 'blink.cmp'
--         ---@type blink.cmp.Config
--         opts = {
--             keymap = { preset = 'enter' },
--
--             appearance = { nerd_font_variant = 'mono' },
--
--             completion = { documentation = { auto_show = true } },
--
--             sources = {
--                 default = { 'lsp', 'path', 'snippets', 'buffer' },
--             },
--
--             fuzzy = { implementation = "prefer_rust_with_warning" }
--         },
--         opts_extend = { "sources.default" }
--     },
-- }

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/mason-org/mason.nvim",
})

require("fidget").setup({})
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
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

-- Diagnostics
-- vim.diagnostic.config({
--     virtual_lines = true,
--     virtual_text = true,
-- })

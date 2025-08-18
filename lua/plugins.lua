-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins_spec = {
    {
		"NMAC427/guess-indent.nvim",
        event = "VeryLazy",
    },

	-- Adds git related signs to the gutter, as well as utilities for managing changes
    {
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Useful plugin to show you pending keybinds.
    {
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
            preset = "helix",
			delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
                { "<leader>s", group = "Search" },
                { "<leader>g", group = "LSP" },
                { "<leader>u", group = "User Settings" },
				{ "<leader>f", group = "Find" },
			},
		},
	},

    -- Collection of various small independent plugins/modules
    {
		"echasnovski/mini.nvim",
		config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require('mini.pairs').setup()
            require('mini.move').setup()
            require('mini.snippets').setup()
            require("mini.completion").setup()
            require("mini.files").setup()
            require("mini.pick").setup()
            require("mini.extra").setup()

            local map_multistep = require('mini.keymap').map_multistep
            map_multistep('i', '<Tab>',   { 'pmenu_next' })
            map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
            map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
            map_multistep('i', '<BS>',    { 'minipairs_bs' })
		end,
        keys = {
            -- Top Pickers & Explorer
            { "<leader>e", function() MiniFiles.open() end, desc = "File Explorer" },
            { "<leader><space>", function() MiniPick.builtin.files() end, desc = "Find Files" },
            { "<leader>/", function() MiniExtra.pickers.buf_lines({ scope = "current" }) end, desc = "Find in Buffer" },
            { "<leader>:", function() MiniExtra.pickers.history({ scope = "cmd" }) end, desc = "Command History" },
            -- find
            { "<leader>fb", function() MiniPick.builtin.buffers() end, desc = "Buffers" },
            { "<leader>fc", function() MiniPick.builtin.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fg", function() MiniExtra.pickers.git_files() end, desc = "Find Git Files" },
            { "<leader>fr", function() MiniPick.builtin.recent() end, desc = "Recent" },
            -- search
            { "<leader>sc", function() MiniExtra.pickers.commands() end, desc = "Commands" },
            { "<leader>sd", function() MiniExtra.pickers.diagnostic() end, desc = "Diagnostics" },
            { "<leader>sD", function() MiniExtra.pickers.diagnostic({ scope = "current" }) end, desc = "Buffer Diagnostics" },
            { "<leader>sh", function() MiniPick.builtin.help() end, desc = "Help Pages" },
            { "<leader>sk", function() MiniExtra.pickers.keymaps() end, desc = "Keymaps" },
            { "<leader>sq", function() MiniExtra.pickers.list({ scope = "quickfix" }) end, desc = "Quickfix List" },
            { "<leader>su", function() MiniExtra.pickers.list({ scope = "change" }) end, desc = "Undo History" },
            { "<leader>st", function() MiniExtra.pickers.colorschemes() end, desc = "Themes" },
            -- LSP
            { "<leader>gd", function() MiniExtra.pickers.lsp({ scope = "definition" }) end, desc = "Goto Definition" },
            { "<leader>gD", function() MiniExtra.pickers.lsp({ scope = "declaration" }) end, desc = "Goto Declaration" },
            { "<leader>gr", function() MiniExtra.pickers.lsp({ scope = "references" }) end, nowait = true, desc = "References" },
            { "<leader>gi", function() MiniExtra.pickers.lsp({ scope = "implementation" }) end, desc = "Goto Implementation" },
            { "<leader>gy", function() MiniExtra.pickers.lsp({ scope = "type_definition" }) end, desc = "Goto T[y]pe Definition" },
            { "<leader>gs", function() MiniExtra.pickers.lsp({ scope = "document_symbol" }) end, desc = "LSP Symbols" },
            { "<leader>gS", function() MiniExtra.pickers.lsp({ scope = "workspace_symbol" }) end, desc = "LSP Workspace Symbols" },
        },
	},

    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    -- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {},
	},

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
	},

    -- {
    --     "folke/snacks.nvim",
    --     priority = 1000,
    --     lazy = false,
    --     ---@type snacks.Config
    --     opts = {
    --         bigfile = { enabled = true },
    --         dashboard = { enabled = true },
    --         explorer = { enabled = true },
    --         indent = { enabled = true, animate = { enabled = false } },
    --         input = { enabled = false },
    --         notifier = {
    --             enabled = true,
    --             timeout = 3000,
    --         },
    --         picker = { enabled = true },
    --         quickfile = { enabled = true },
    --         scope = { enabled = true },
    --         scroll = { enabled = true },
    --         statuscolumn = { enabled = true },
    --         words = { enabled = false },
    --         styles = {
    --             notification = {
    --                 -- wo = { wrap = true } -- Wrap notifications
    --             }
    --         }
    --     },
    --     keys = {
    --         -- Top Pickers & Explorer
    --         { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
    --         { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    --         { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    --         { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    --         { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    --         -- find
    --         { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    --         { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    --         { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    --         { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    --         { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    --         { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    --         -- search
    --         { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    --         { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    --         { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    --         { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    --         { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    --         { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    --         { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    --         { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    --         { "<leader>st", function() Snacks.picker.colorschemes() end, desc = "Themes" },
    --         -- LSP
    --         { "<leader>gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    --         { "<leader>gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    --         { "<leader>gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    --         { "<leader>gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    --         { "<leader>gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    --         { "<leader>gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    --         { "<leader>gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    --         -- Other
    --         { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    --         { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    --         { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    --         { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    --     },
    --     init = function()
    --         vim.g.snacks_animate = false
    --         vim.api.nvim_create_autocmd("User", {
    --             pattern = "VeryLazy",
    --             callback = function()
    --                 -- Setup some globals for debugging (lazy-loaded)
    --                 _G.dd = function(...)
    --                     Snacks.debug.inspect(...)
    --                 end
    --                 _G.bt = function()
    --                     Snacks.debug.backtrace()
    --                 end
    --                 vim.print = _G.dd -- Override print to use snacks for `:=` command
    --
    --                 -- Create some toggle mappings
    --                 Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    --                 Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    --                 Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    --                 Snacks.toggle.diagnostics():map("<leader>ud")
    --                 Snacks.toggle.line_number():map("<leader>ul")
    --                 Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
    --                 Snacks.toggle.treesitter():map("<leader>uT")
    --                 Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    --                 Snacks.toggle.inlay_hints():map("<leader>uh")
    --                 Snacks.toggle.indent():map("<leader>ug")
    --                 Snacks.toggle.dim():map("<leader>uD")
    --             end,
    --         })
    --     end,
    -- },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<C-5>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<C-6>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<C-7>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<C-8>", function() harpoon:list():select(8) end)
            vim.keymap.set("n", "<C-9>", function() harpoon:list():select(9) end)
            vim.keymap.set("n", "<C-0>", function() harpoon:list():select(10) end)
        end,
    },

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

-- Setup lazy.nvim
require("lazy").setup({
    spec = plugins_spec,
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

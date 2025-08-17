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
				{ "<leader>f", group = "Find" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
			},
		},
	},

    -- Collection of various small independent plugins/modules
    {
		"echasnovski/mini.nvim",
		config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require('mini.pairs').setup()
            require("mini.completion").setup()
            local map_multistep = require('mini.keymap').map_multistep

            map_multistep('i', '<Tab>',   { 'pmenu_next' })
            map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
            map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
            map_multistep('i', '<BS>',    { 'minipairs_bs' })
		end,
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

    {
        "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" },
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
            { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Search Buffers" },
            { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep Project" },
            { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help" },
            { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
            { "<leader>fs", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "In Buffer" },
            { "<leader>fb", "<cmd>FzfLua builtin<cr>", desc = "Builtin" },
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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        keys = {
            { "<leader>e", "<cmd>Neotree focus toggle<cr>", desc = "Toggle Neotree" }
        },
        lazy = false, -- neo-tree will lazily load itself
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

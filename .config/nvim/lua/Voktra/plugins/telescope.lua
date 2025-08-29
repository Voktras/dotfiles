return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- using master to fix issues with deprecated to definition warnings
	-- '0.1.x' for stable ver.
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				prompt_prefix = " ",
				selection_caret = "👉 ",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						preview_width = 0.55,
					},
					vertical = {
						width = 0.9,
						height = 0.95,
						preview_height = 0.5,
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				buffers = {
					prompt_prefix = "󰸩 ",
				},
				commands = {
					prompt_prefix = " ",
				},
				command_history = {
					prompt_prefix = " ",
				},
				git_files = {
					prompt_prefix = "󰊢 ",
				},
				find_files = {
					prompt_prefix = " ",
				},
				live_grep = {
					prompt_prefix = "󰱽 ",
				},
				grep_string = {
					prompt_prefix = "󰱽 ",
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
	end,
}

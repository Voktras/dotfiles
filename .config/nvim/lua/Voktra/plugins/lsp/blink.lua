return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"brenoprata10/nvim-highlight-colors",
		"folke/lazydev.nvim",
		"Kaiser-Yang/blink-cmp-avante", -- Ensure this is installed
		"Kaiser-Yang/blink-cmp-git",
		"MahanRahmati/blink-nerdfont.nvim",
		"moyiz/blink-emoji.nvim",
		"rafamadriz/friendly-snippets",
		"nvim-lua/plenary.nvim",
		{
			"onsails/lspkind.nvim",
			opts = {},
		},
	},

	opts = {
		appearance = { nerd_font_variant = "mono" },
		signature = { enabled = true },

		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
		},

		completion = {
			documentation = { auto_show = true },
			list = { selection = { preselect = true, auto_insert = true } },
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr then
										icon = color_item.abbr
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end
								elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local highlight = "BlinkCmpKind" .. ctx.kind
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr_hl_group then
										highlight = color_item.abbr_hl_group
									end
								end
								return highlight
							end,
						},
					},
				},
			},
		},

		sources = {
			default = { "avante", "git", "lazydev", "lsp", "path", "snippets", "buffer", "emoji", "nerdfont" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					-- Add basic configuration to avoid nil values
					enabled = true,
					score_offset = 100,
				},
				git = {
					module = "blink-cmp-git",
					name = "Git",
					enabled = function()
						return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
					end,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				nerdfont = {
					module = "blink-nerdfont",
					name = "Nerd Fonts",
					score_offset = 15,
					opts = { insert = true },
				},
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 25,
					opts = { insert = true },
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}

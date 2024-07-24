return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = false,
			build = "make install_jsregexp",
		},
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
		"lukas-reineke/cmp-under-comparator",
		"SergioRibera/cmp-dotenv",
	},
	config = function(_, opts)
		local cmp = require("cmp")
		local ls = require("luasnip")
		local types = require("luasnip.util.types")
		local vscode = require("luasnip.loaders.from_vscode")
		local lspkind = require("lspkind")
		local hl = vim.api.nvim_set_hl

		ls.filetype_extend("javascriptreact", { "html" })
		ls.filetype_extend("typescriptreact", { "html" })
		ls.filetype_extend("markdown", { "html" })
		ls.filetype_extend("astro", { "html", "javascript", "typescript" })

		vscode.lazy_load({ paths = { "./lua/snippets" } })
		vscode.lazy_load()

		ls.config.set_config({
			history = true,
			delete_check_events = "TextChanged",
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})

		-- hl(0, "CmpItemAbbr", { fg = "#CDD6F4" })
		-- hl(0, "CmpItemAbbrMatch", { fg = "#94E2D5" })
		-- hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#89B4FA" })
		-- hl(0, "CmpItemMenu", { fg = "#F38BA8" })
		-- hl(0, "MyCursorLine", { bg = "#45475A", bold = true })
		-- hl(0, "CmpBorder", { fg = "#45475A" })

		local icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "󰈮",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		cmp.setup({
			completion = {
				-- completeopt = "menu,menuone",
				completeopt = "menu,menuone,noinsert",
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "dotenv" },
			}),
			-- duplicates = {
			--   luasnip = 0,
			--   nvim_lsp = 0,
			--   buffer = 0,
			--   path = 0,
			-- },
			formatting = {
				-- fields = { "kind", "abbr", "menu" },
				fields = { "menu", "abbr", "kind" },
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = false,
					before = function(entry, vim_item)
						vim_item.kind = (icons[vim_item.kind] or "foo") --.. " " .. vim_item.kind
						vim_item.menu = ({
							luasnip = "",
							nvim_lsp = "",
							nvim_lua = "[Lua]",
							buffer = "",
							path = "",
							cmdline = "",
						})[entry.source.name]
						-- Duplicates
						-- vim_item.dup = ({
						--   nvim_lsp = 0,
						--   luasnip = 0,
						--   buffer = 0,
						--   path = 0,
						-- })[entry.source.name]
						-- vim_item.kind, vim_item.menu = vim_item.menu, vim_item.kind
						require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
						return vim_item
					end,
				}),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					side_padding = 1,
					col_offset = -3,
					-- winhighlight = "Normal:None,FloatBorder:CmpBorder,CursorLine:MyCursorLine,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					-- winhighlight = "Normal:None,FloatBorder:CmpBorder,CursorLine:MyCursorLine,Search:None",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			experimental = {
				native_menu = false,
				ghost_text = true,
			},
			--NOTE: cmp-under-comparator
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					require("cmp-under-comparator").under,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			completion = {
				completeopt = "noselect",
			},
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			-- mapping = cmp.mapping.preset.cmdline(),
			mapping = cmp.mapping({
				["<C-j>"] = cmp.mapping({
					c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				}),
				["<C-k>"] = cmp.mapping({
					c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				}),
			}),
		})
	end,
}

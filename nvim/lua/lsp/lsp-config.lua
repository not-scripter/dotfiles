return {
	{
		"williamboman/mason.nvim",
		vim.lsp.set_log_level("off"),
		-- vim.lsp.set_log_level("debug"),
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					-- "stylua",
					"eslint_d",
					"pylint",
					"isort",
					"black",
					"js-debug-adapter",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- "lua_ls",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					"astro",
					-- "clangd",
					"arduino_language_server",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"folke/neodev.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local keymap = vim.keymap.set

			local signs = {
				Error = " ",
				Warn = " ",
				Hint = "󰠠 ",
				Info = " ",
			}
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			lspconfig.html.setup({
				capabilities = capabilities,
			})
			-- lspconfig.tsserver.setup({
			--   capabilities = capabilities,
			--   -- init_options = {
			--   --   preferences = {
			--   --     disableSuggestions = true,
			--   --   }
			--   -- },
			-- })
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.arduino_language_server.setup({
				capabilities = capabilities,
			})

			-- lspconfig.emmet_ls.setup({
			-- 	capabilities = capabilities,
			-- })

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			keymap("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
			keymap("n", "gr", vim.lsp.buf.references, { desc = "Reference" })
			keymap("n", "rn", vim.lsp.buf.rename, { desc = "Rename" })
			-- keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {desc = "Code Action"})
		end,
	},

	-- Test
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
}

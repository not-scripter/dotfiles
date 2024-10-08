return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					["*"] = { "codespell" },
					["_"] = { "prettier", "trim_whitespace" },
					bash = { "beautysh" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					svelte = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					html = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					yaml = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					graphql = { "prettierd", "prettier" },
					lua = { "stylua", "prettier" },
					python = { "isort", "black", "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 5000,
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>L", function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 5000,
				})
			end, { desc = "format buffer" })
		end,
	},
	{
		"Wansmer/treesj",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {},
	},
}

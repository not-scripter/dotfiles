return {
	{
		"ThePrimeagen/vim-be-good",
	},

	--TEST:
	{
		"romgrk/nvim-treesitter-context",
		enabled = false,
		config = function()
			require("treesitter-context").setup({
				enable = true,
				throttle = true,
				max_lines = 0,
				patterns = {
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope-project.nvim",
		event = "BufWinEnter",
		setup = function()
			vim.cmd([[packadd telescope.nvim]])
		end,
	},

	--TEST: replacing null-ls
	-- {
	--   'mfussenegger/nvim-lint',
	--   enabled = false,
	--   config = function()
	--     local lint = require("lint")
	--     lint.linters_by_ft = {
	--       markdown = {'vale',},
	--       -- javascript = {"eslint"}
	--     }
	--
	--     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	--       callback = function()
	--         lint.try_lint()
	--         lint.try_lint("cspell")
	--       end,
	--     })
	--   end
	-- },

	--TEST: Floating win bar
	{
		"b0o/incline.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			local helpers = require("incline.helpers")
			local navic = require("nvim-navic")
			local devicons = require("nvim-web-devicons")
			require("incline").setup({})
		end,
	},

	--TEST: music player
	--TEST: color picker
}

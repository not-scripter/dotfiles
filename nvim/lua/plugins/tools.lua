return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "lua", "vim", "html", "css", "javascript", "typescript", "tsx", "norg", "json", "python", "gitignore", "git_config", "jsonc" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'kevinhwang91/nvim-ufo', 
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
    end,
  },
  {
    'numToStr/Comment.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = {"BufReadPre", "BufNewFile"},
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        }
      })
      vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, { desc="Session Manager", noremap = true })
    end
  },
  {
    'jvgrootveld/telescope-zoxide',
    dependencies = {
      'nanotee/zoxide.vim',
      'nvim-lua/popup.nvim',
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension('zoxide')
      vim.keymap.set("n", "<leader>zf", telescope.extensions.zoxide.list, { desc = "Zoxide Find" })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
}

return {
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
}

return {
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
}

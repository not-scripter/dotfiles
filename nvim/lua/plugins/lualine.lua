return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', opt = true
  },
  config = function()
    -- require("lualine").setup({
    --   options = {
    --     theme = "catppuccin",
    --   },
    -- })

--     local lualine = require('lualine')
--     local colors = {
--       bg       = '#000000',
--       fg       = '#9399b2',
--       yellow   = '#fab387',
--       cyan     = '#89dceb',
--       darkblue = '#b4befe',
--       green    = '#98be65',
--       orange   = '#FF8800',
--       violet   = '#cba6f7',
--       magenta  = '#f5c2e7',
--       blue     = '#89b4fa',
--       red      = '#f38ba8',
--     }
--
-- local conditions = {
--   buffer_not_empty = function()
--     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
--   end,
--   hide_in_width = function()
--     return vim.fn.winwidth(0) > 80
--   end,
--   check_git_workspace = function()
--     local filepath = vim.fn.expand('%:p:h')
--     local gitdir = vim.fn.finddir('.git', filepath .. ';')
--     return gitdir and #gitdir > 0 and #gitdir < #filepath
--   end,
-- }
--
-- -- Config
-- local config = {
--   options = {
--     -- Disable sections and component separators
--     component_separators = '',
--     section_separators = '',
--     theme = {
--       -- We are going to use lualine_c an lualine_x as left and
--       -- right section. Both are highlighted by c theme .  So we
--       -- are just setting default looks o statusline
--       normal = { c = { fg = colors.fg, bg = colors.bg } },
--       inactive = { c = { fg = colors.fg, bg = colors.bg } },
--     },
--   },
--   sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     -- These will be filled later
--     lualine_c = {},
--     lualine_x = {},
--   },
--   inactive_sections = {
--     -- these are to remove the defaults
--     lualine_a = {},
--     lualine_b = {},
--     lualine_y = {},
--     lualine_z = {},
--     lualine_c = {},
--     lualine_x = {},
--   },
-- }
--
-- -- Inserts a component in lualine_c at left section
-- local function ins_left(component)
--   table.insert(config.sections.lualine_c, component)
-- end
--
-- -- Inserts a component in lualine_x at right section
-- local function ins_right(component)
--   table.insert(config.sections.lualine_x, component)
-- end
--
-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- }
--
-- ins_left {
--   -- mode component
--   function()
--     return ''
--   end,
--   color = function()
--     -- auto change color according to neovims mode
--     local mode_color = {
--       n = colors.red,
--       i = colors.green,
--       v = colors.blue,
--       [''] = colors.blue,
--       V = colors.blue,
--       c = colors.magenta,
--       no = colors.red,
--       s = colors.orange,
--       S = colors.orange,
--       [''] = colors.orange,
--       ic = colors.yellow,
--       R = colors.violet,
--       Rv = colors.violet,
--       cv = colors.red,
--       ce = colors.red,
--       r = colors.cyan,
--       rm = colors.cyan,
--       ['r?'] = colors.cyan,
--       ['!'] = colors.red,
--       t = colors.red,
--     }
--     return { fg = mode_color[vim.fn.mode()] }
--   end,
--   padding = { right = 1 },
-- }
--
-- ins_left {
--   'filename',
--   cond = conditions.buffer_not_empty,
--   color = { fg = colors.magenta, gui = 'bold' },
-- }
--
-- ins_left {
--   'filesize',
--   cond = conditions.buffer_not_empty,
-- }
--
-- ins_left { 'location' }
--
-- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
--
-- ins_left {
--   'diagnostics',
--   sources = { 'nvim_diagnostic' },
--   symbols = { error = ' ', warn = ' ', info = ' ' },
--   diagnostics_color = {
--     color_error = { fg = colors.red },
--     color_warn = { fg = colors.yellow },
--     color_info = { fg = colors.cyan },
--   },
-- }
--
-- -- ins_left {
-- --   function()
-- --     return '%='
-- --   end,
-- -- }
--
-- -- ins_left {
-- --   -- Lsp server name .
-- --   function()
-- --     local msg = 'No Active Lsp'
-- --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
-- --     local clients = vim.lsp.get_active_clients()
-- --     if next(clients) == nil then
-- --       return msg
-- --     end
-- --     for _, client in ipairs(clients) do
-- --       local filetypes = client.config.filetypes
-- --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- --         return client.name
-- --       end
-- --     end
-- --     return msg
-- --   end,
-- --   icon = ' ',
-- --   color = { fg = 'colors.red', gui = 'bold' },
-- -- }
--
-- -- ins_right {
-- --   'o:encoding', -- option component same as &encoding in viml
-- --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- --   cond = conditions.hide_in_width,
-- --   color = { fg = colors.green, gui = 'bold' },
-- -- }
--
-- ins_right {
--   'branch',
--   icon = '',
--   color = { fg = colors.violet, gui = 'bold' },
-- }
--
-- ins_right {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = true,
--   color = { fg = colors.red, gui = 'bold' },
-- }
--
-- ins_right {
--   'diff',
--   symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
--   diff_color = {
--     added = { fg = colors.green },
--     modified = { fg = colors.orange },
--     removed = { fg = colors.red },
--   },
--   cond = conditions.hide_in_width,
-- }
--
-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.blue },
--   padding = { left = 1 },
-- }
--     lualine.setup(config)

    local colors = {
      black    = '#000000',
      white    = '#9399b2',
      blue     = '#89b4fa',
      cyan     = '#89dceb',
      darkblue = '#b4befe',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#cba6f7',
      magenta  = '#f5c2e7',
      red      = '#f38ba8',
    }

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
    x = { fg = colors.white, bg = colors.black },
    y = { fg = colors.white, bg = colors.black },
    z = { fg = colors.black, bg = colors.violet },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

    local function file_icon()
      return [[󰈮]]
    end
    local function line_icon()
      return [[󰦨]]
    end

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        -- component_separators = '|',
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          -- {'branch', icon = {'', align='right', color={fg='green'}}}
          { file_icon, separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
          { 'filename', separator = { left = '' }, right_padding = 2 },
          { 'filesize', separator = { left = '' }, right_padding = 2 },
        },
        lualine_c = {
          { 'diagnostics', separator = { left = '' }, right_padding = 2 },
          { 'hostname', separator = { left = '' }, right_padding = 2 },
        },
        lualine_x = {
          { 'diff', separator = { left = '' }, right_padding = 2 },
          { 'branch', separator = { left = '' }, right_padding = 2 },
        },
        lualine_y = {
          { 'selectioncount', separator = { left = '' }, right_padding = 2 },
          { 'progress', separator = { left = '' }, right_padding = 0 },
          { 'location', separator = { left = '' }, right_padding = 0 },
        },
        lualine_z = {
          { line_icon, separator = { left = '' }, right_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }

  end
}

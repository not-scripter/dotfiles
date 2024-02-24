return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', opt = true
  },
  config = function()
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
        theme = "catppuccin", --tokyonight, catppuccin
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

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    "onsails/lspkind.nvim",
  },
  event = "InsertEnter",
  config = function(_, opts)
    local cmp = require'cmp'
    local luasnip = require("luasnip")
    local vscode = require("luasnip.loaders.from_vscode")
    local lspkind = require('lspkind')

    vscode.lazy_load()
    vscode.lazy_load({ paths = { "./lua/snippets" } })
    luasnip.filetype_extend("javascript", { "javascriptreact" })
    luasnip.filetype_extend("javascriptreact", { "html" })
    --
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#9399b2" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89dceb" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "MyCursorLine", { fg = "#000000", bg = "#cba6f7", bold = true })

    icons = {
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
      Value = "󰎠",
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
    },

    cmp.setup({
      -- completion = {
      --   completeopt = "menu,menuone",
      -- },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function (entry, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "foo") --.. " " .. vim_item.kind
            vim_item.menu = ({
              luasnip = "",
              nvim_lsp = "",
              buffer = "",
              path = "",
              cmdline = "",
            })[entry.source.name]
            vim_item.kind, vim_item.menu = vim_item.menu, vim_item.kind
            return vim_item
          end
        })
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) 
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          -- border = "none",
          side_padding = 0,
          col_offset = -3,
          winhighlight = "Normal:None,FloatBorder:None,CursorLine:MyCursorLine,Search:None",
        }),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources {
        { name = "luasnip", priority = 1000 },
        { name = "nvim_lsp", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
      duplicates = {
        luasnip = 0,
        nvim_lsp = 0,
        cmp_tabnine = 0,
        buffer = 0,
        path = 0,
      },
    })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  end,

}

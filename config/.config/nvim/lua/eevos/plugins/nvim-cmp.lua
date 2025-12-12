-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- find more here: https://www.nerdfonts.com/cheat-sheet
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {
      'i',
      'c'
    }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {
      'i',
      'c'
    }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {
      'i',
      'c'
    }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true
    }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  formatting = {
    fields = {
      "abbr",
      "kind",
      "menu"
    },
    format = function(entry, vim_item)
      -- Kind icons
      -- This concatonates the icons with the name of the item kind
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind],
                                    vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]"
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    {
      name = "nvim_lsp"
    },
    {
      name = "luasnip"
    },
    {
      name = "buffer"
    },
    {
      name = "path"
    }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  },
  -- documentation = {border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}},
  experimental = {
    ghost_text = true,
    native_menu = false
  }
}

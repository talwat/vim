return {
  "catppuccin/nvim", name = "catppuccin", opts = {
    flavour = "macchiato",
    custom_highlights = function(c)
      return {
        TelescopeNormal = {
          bg = c.bg,
          fg = c.fg,
        },
        TelescopeBorder = {
          bg = c.bg,
          fg = c.bg,
        },
        TelescopePromptTitle = {
          bg = c.bg_higght,
          fg = c.fg,
        },
        TelescopePreviewTitle = {
          bg = c.bg,
          fg = c.bg,
        },
        TelescopeResultsTitle = {
          bg = c.bg,
          fg = c.bg,
        },
        NoiceCmdlinePopupBorder = {
          bg = c.bg,
          fg = c.bg,
        }
      }
    end,
    integrations = {
      bufferline = true,
    },
  }, priority = 1000,
}

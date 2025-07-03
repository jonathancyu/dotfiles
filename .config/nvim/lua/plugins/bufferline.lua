return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thick",
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      indicator = {
        style = "underline",
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      show_close_icon = false,
      show_buffer_close_icons = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
  keys = {
    { "<S-h>", false },
  },
}

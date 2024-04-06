-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").ltex.setup({
  settings = {
    ltex = {
      language = "auto",
    },
  },
})

local pywal16 = require("pywal16")

pywal16.setup()

local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "pywal16-nvim",
  },
})

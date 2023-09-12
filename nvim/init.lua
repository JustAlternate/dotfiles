-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local pywal = require("pywal")
pywal.setup()

local lualine = require("lualine")
lualine.setup({
  options = {
    theme = "pywal-nvim",
  },
})

local llm = require("llm")

llm.setup({
  api_token = "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",
  model = "bigcode/starcoder",
  -- parameters that are added to the request body
  query_params = {
    max_new_tokens = 60,
    temperature = 0.2,
    top_p = 0.95,
    stop_token = "<|endoftext|>",
  },
  -- set this if the model supports fill in the middle
  fim = {
    enabled = true,
    prefix = "<fim_prefix>",
    middle = "<fim_middle>",
    suffix = "<fim_suffix>",
  },
  debounce_ms = 150,
  accept_keymap = "²",
  dismiss_keymap = "<S-Tab>",
  max_context_after = 5000,
  max_context_before = 5000,
  tls_skip_verify_insecure = false,
  -- llm-ls integration
  lsp = {
    enabled = false,
    bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/llm_nvim/bin/llm-ls",
  },
  tokenizer_path = nil, -- when setting model as a URL, set this var
  context_window = 8192, -- max number of tokens for the context window
})

require("transparent").setup({
  groups = { -- table: default groups
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLineNr",
    "EndOfBuffer",
  },
  extra_groups = {
    "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
    "NvimTreeNormal", -- NvimTree
  },
  exclude_groups = {}, -- table: groups you don't want to clear
})

require("lspconfig").ltex.setup({
  settings = {
    ltex = {
      language = "auto",
    },
  },
})

return {
  {
    "nmac427/guess-indent.nvim",
  },
  {
    "lambdalisue/suda.vim",
  },
  --disable mini.pairs
  -- { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {--[[ things you want to change go here]]
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    opts = {
      symbols = {
        filter = {
          rust = vim.list_extend(vim.deepcopy(LazyVim.config.kind_filter["default"]), { "Object" }),
        },
      },
    },
  },
}

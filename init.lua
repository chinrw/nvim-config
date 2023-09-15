-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local uv = require("luv")
local cpus = uv.available_parallelism()

-- vim.opt.rtp:append("/usr/share/vim/vimfiles")

require("lspconfig").clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--fallback-style=google",
    "-j=" .. cpus,
    "--all-scopes-completion",
    "--pch-storage=memory",
    "--clang-tidy",
    "--log=error",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--enable-config",
    "--offset-encoding=utf-16",
    "--ranking-model=heuristics",
  },
})

local opts = {
  tools = { -- rust-tools options
    inlay_hints = {
      auto = false,
      only_current_line = false,
      show_parameter_hints = false,
    },
  },
}
require("rust-tools").setup(opts)

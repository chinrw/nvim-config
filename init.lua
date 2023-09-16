-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.rtp:append("/usr/share/vim/vimfiles")

local uv = require("luv")
local cpus = uv.available_parallelism()
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

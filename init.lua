-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local uv = require("luv")
local cpus = uv.available_parallelism()

require("lspconfig").clangd.setup({
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),

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

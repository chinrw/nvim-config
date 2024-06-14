-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.rtp:append("/usr/share/vim/vimfiles")

-- local uv = require("luv")
-- local cpus = uv.available_parallelism()
-- require("lspconfig").clangd.setup({
--   cmd = {
--     "clangd",
--     "--background-index",
--     "--fallback-style=google",
--     "-j=" .. cpus,
--     "--all-scopes-completion",
--     "--pch-storage=memory",
--     "--log=error",
--     "--completion-style=detailed",
--     "--header-insertion=iwyu",
--     "--header-insertion-decorators",
--     "--enable-config",
--     "--offset-encoding=utf-16",
--     "--ranking-model=heuristics",
--   },
-- })

require("mason-lspconfig").setup({
  ensure_installed = {},
})

require("lsp-lens").setup({
  enable = false,
  sections = {
    definition = function(count)
      return "Def: " .. count
    end,
    references = function(count)
      return "Ref: " .. count
    end,
    implements = function(count)
      return "Impl: " .. count
    end,
    git_authors = function(latest_author, count)
      return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
    end,
  },
})

require("guess-indent").setup()

-- vim.cmd(":Copilot disable")

require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
})

vim.diagnostic.config({
  virtual_text = false,
})

local user = vim.env.USER
if user and user == "chin39" then
  vim.reload_config_on_save = true
  require("custom_user")
end

vim.cmd(":Copilot disable")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local _, cmp = pcall(require, "cmp")

-- `:` cmdline setup.
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     {
--       name = "cmdline",
--       option = {
--         ignore_cmds = { "Man", "!" },
--       },
--     },
--   }),
-- })
require("cmp").setup({
  sources = {
    { name = "nvim_lsp_signature_help" },
  },
})

local uv = require("luv")
local cpus = uv.available_parallelism()

return {
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      inlay_hints = {
        inline = true,
      },
    },
  },
}

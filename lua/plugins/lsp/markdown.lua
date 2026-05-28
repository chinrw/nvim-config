return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = vim.tbl_deep_extend("force", opts.linters["markdownlint-cli2"] or {}, {
        args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint.yaml", "-" },
      })
      return opts
    end,
  },

  { "iamcco/markdown-preview.nvim", enabled = false },
}

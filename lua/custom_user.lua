return {
  require("lspconfig").rust_analyzer.setup({
    cmd = { "/opt/homebrew/bin/rust-analyzer" },
  }),
  function()
    vim.g.instant_username = vim.env.USER
  end,
}

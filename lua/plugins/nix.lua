-- Nix tools come from home-manager, not Mason. Each one is enabled only when
-- its binary is on PATH, so machines without Nix load nothing extra and never
-- hit "executable not found" errors when a .nix file is opened.
local function has(bin)
  return vim.fn.executable(bin) == 1
end

if not has("nix") then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "nix" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = { enabled = has("nixd"), mason = false },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = { nix = has("nixfmt") and { "nixfmt" } or nil },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = { nix = has("statix") and { "statix" } or nil },
    },
  },
}

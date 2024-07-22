return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            procMacro = {
              enable = true,
              attributes = {
                enable = true,
              },
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
  {
    "vxpm/ferris.nvim",
    config = function()
      require("ferris").setup({
        -- your options here
      })

      vim.keymap.set("n", "gm", require("ferris.methods.view_memory_layout"), { desc = "View Memory Layout" })
      vim.keymap.set("n", "gS", require("ferris.methods.expand_macro"), { desc = "Expand Macro" })
    end,
  },
}

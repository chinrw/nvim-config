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
  {
    "cordx56/rustowl",
    version = "*", -- Latest stable version
    lazy = false, -- This plugin is already lazy
    opts = {
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set("n", "<leader>o", function()
            require("rustowl").toggle(buffer)
          end, { buffer = buffer, desc = "Toggle RustOwl" })
        end,
      },
        highlight_style = 'undercurl', -- You can also use 'underline'
    },
  },
}

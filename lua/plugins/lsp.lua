return {
  -- {
  --   "numToStr/Comment.nvim",
  --   opts = {
  --     -- add any options here
  --     toggler = {
  --       ---Line-comment toggle keymap
  --       line = "gc",
  --       ---Block-comment toggle keymap
  --       block = "gb",
  --     },
  --   },
  --   lazy = true,
  -- },
  -- {
  --   "lewis6991/hover.nvim",
  --   config = function()
  --     require("hover").setup({
  --       init = function()
  --         -- Require providers
  --         require("hover.providers.lsp")
  --         require("hover.providers.gh")
  --         require("hover.providers.gh_user")
  --         -- require('hover.providers.jira')
  --         require("hover.providers.man")
  --         require("hover.providers.dictionary")
  --       end,
  --       preview_opts = {
  --         border = nil,
  --       },
  --       -- Whether the contents of a currently open hover window should be moved
  --       -- to a :h preview-window when pressing the hover keymap.
  --       preview_window = false,
  --       title = true,
  --     })
  --
  --     -- Setup keymaps
  --     vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
  --     vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
  --   end,
  -- },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "flake8",
        "isort",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
        show_parameter_hints = true,
      },
      -- add any global capabilities here
      capabilities = {},
      servers = {
        clangd = {
          mason = false,
        },
        marksman = {
          mason = false,
        },
      },
      -- Automatically format on save
      autoformat = false,
      setup = {
        clangd = function(_, opts)
          local uv = require("luv")
          local cpus = uv.available_parallelism() or 4 -- Fallback to 4 if not available
          opts.cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--all-scopes-completion",
            "-j=" .. cpus,
          }
        end,
      },
      diagnostics = {
        underline = false,
        update_in_insert = false,
        virtual_lines = {
          current_line = false,
        },
        virtual_text = false,
        -- virtual_text = {
        --   spacing = 2,
        --   source = "if_many",
        --   -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        --   -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        --   prefix = "icons",
        -- },
        severity_sort = true,
      },
    },
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  -- {
  --   "L3MON4D3/LuaSnip",
  --   keys = function()
  --     return {}
  --   end,
  -- },
  { "VidocqH/lsp-lens.nvim" },
}

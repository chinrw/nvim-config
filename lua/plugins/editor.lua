return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
    { "<leader>gf", "<cmd>Telescope git_bcommits<CR>", desc = "buffer commits" },
    },
  },
  {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>gy",
      function()
        require("yazi").yazi()
      end,
      { desc = "yazi fm" },
    },
  },
  }
}

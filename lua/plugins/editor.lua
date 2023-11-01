return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
    { "<leader>gf", "<cmd>Telescope git_bcommits<CR>", desc = "buffer commits" },
    },
  },
}

return {
  {
    "gelguy/wilder.nvim",
    config = function()
      -- config goes here
    end,
  },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = { wrap = true, auto_preview = false, auto_unfold_hover = false },
  },
}

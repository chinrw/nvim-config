return {
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      local status_ok, hop = pcall(require, "hop")
      if not status_ok then
        return
      end
      hop.setup()
      vim.keymap.set("", "<Leader>k", function()
        hop.hint_words()
      end, { remap = true })

      hop.setup({ keys = "etovxqpdgfblzhckisuran;" })
    end,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
}

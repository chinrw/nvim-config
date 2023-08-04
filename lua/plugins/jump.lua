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
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1()
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_anywhere({ current_line_only = true, direction = directions.AFTER_CURSOR })
      end, { remap = true })
      vim.keymap.set("", "<Leader>j", function()
        hop.hint_patterns()
      end, { remap = true })
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

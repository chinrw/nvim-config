return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "autopep8", "isort" },
      },
      formatters = {
        -- black = {
        --   prepend_args = { "-S", "--preview", "--enable-unstable-feature", "hug_parens_with_braces_and_square_brackets" },
        -- },
        autopep8 = {
          prepend_args = { "--aggressive", "--aggressive" },
        },
      },
    },
  },
}

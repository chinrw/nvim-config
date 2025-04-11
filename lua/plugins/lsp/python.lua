return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black", "isort" },
      },
      formatters = {
        black = {
          prepend_args = { "-S", "--preview", "--enable-unstable-feature", "hug_parens_with_braces_and_square_brackets" },
        },
      },
    },
  },
}

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "pyrefly" },
      },
      linters = {
        pyrefly = {
          cmd = "pyrefly",
          args = { "check", "--output-format", "json" },
          stdin = false,
          append_fname = true,
          stream = "stdout",
          ignore_exitcode = true,
          parser = function(output, bufnr)
            local diagnostics = {}
            -- Remove the trailing INFO line if present
            local json_str = output:match("^(%{.-%})%s*INFO") or output:match("^(%{.-%})$")
            if not json_str then
              return diagnostics
            end
            local ok, result = pcall(vim.json.decode, json_str)
            if not ok or not result or not result.errors then
              return diagnostics
            end
            for _, item in ipairs(result.errors) do
              table.insert(diagnostics, {
                lnum = (item.line or 1) - 1,
                col = (item.column or 1) - 1,
                end_lnum = (item.stop_line or item.line or 1) - 1,
                end_col = (item.stop_column or item.column or 1) - 1,
                severity = vim.diagnostic.severity.ERROR,
                message = item.description or item.concise_description or "pyrefly error",
                source = "pyrefly",
                code = item.name,
              })
            end
            return diagnostics
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black", "isort" },
      },
      formatters = {
        black = {
          prepend_args = {
            "-S",
            "--preview",
            "--enable-unstable-feature",
            "hug_parens_with_braces_and_square_brackets",
            "--enable-unstable-feature",
            "multiline_string_handling",
            "--enable-unstable-feature",
            "string_processing",
          },
        },
        -- autopep8 = {
        --   prepend_args = { "--aggressive", "--aggressive" },
        -- },
      },
    },
  },
}

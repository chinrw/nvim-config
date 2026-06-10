-- Skip node-based tools when node is missing.
-- vim.g.enable_node_tools: "auto" (default) | true = always on | false = always off
local mode = vim.g.enable_node_tools
if mode == true or (mode ~= false and vim.fn.executable("node") == 1) then
  return {}
end

local function drop_node_tools(list)
  return vim.tbl_filter(function(name)
    return name ~= "prettier" and name ~= "markdownlint-cli2" and name ~= "markdown-toc"
  end, list or {})
end

local function drop_node_tools_per_ft(map)
  for ft, tools in pairs(map or {}) do
    if type(tools) == "table" then
      map[ft] = drop_node_tools(tools)
    end
  end
end

return {
  { -- not installed
    "mason-org/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = drop_node_tools(opts.ensure_installed)
    end,
  },
  { -- not started
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        jsonls = { enabled = false },
        yamlls = { enabled = false },
        dockerls = { enabled = false },
        docker_compose_language_service = { enabled = false },
      },
    },
  },
  { -- not used to format
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      drop_node_tools_per_ft(opts.formatters_by_ft)
    end,
  },
  { -- not used to lint
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      drop_node_tools_per_ft(opts.linters_by_ft)
    end,
  },
}

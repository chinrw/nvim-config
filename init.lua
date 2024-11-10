-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.rtp:append("/usr/share/vim/vimfiles")
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
    local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
    copy_to_unnamedplus(vim.v.event.regcontents)
    local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
    copy_to_unnamed(vim.v.event.regcontents)
  end,
})

require("mason-lspconfig").setup({
  ensure_installed = {},
})

require("lsp-lens").setup({
  enable = false,
  sections = {
    definition = function(count)
      return "Def: " .. count
    end,
    references = function(count)
      return "Ref: " .. count
    end,
    implements = function(count)
      return "Impl: " .. count
    end,
    git_authors = function(latest_author, count)
      return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
    end,
  },
})

require("guess-indent").setup({})

-- vim.cmd(":Copilot disable")

require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
})

vim.diagnostic.config({
  virtual_text = false,
})

local user = vim.env.USER
if user and user == "chin39" then
  vim.reload_config_on_save = true
  require("custom_user")
end

-- vim.cmd(":Copilot disable")

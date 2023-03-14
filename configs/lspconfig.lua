local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "elixirls", "volar", "emmet_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/packages/elixir-ls/language_server.sh") }
}

-- emmet 

lspconfig.emmet_ls.setup {
  cmd = {"emmet-ls", "--stdio"},
  filetypes = { "html", "css", "sass", "scss", "vue" },
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {},
}
-- :lua vim.lsp.buf.format()

-- 
-- lspconfig.pyright.setup { blabla}

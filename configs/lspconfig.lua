local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "volar", "elixirls" }

-- local lsp_keymaps = function(bufnr)
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
--
-- 	local telescope_opts = { hidden = true, layout_config = { prompt_position = "top" } }
--
-- 	-- Mappings of diagnostics.
-- 	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- 	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
-- 	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- 	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--
-- 	-- Mappings of LSP actions
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- 	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
-- 	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- 	vim.keymap.set("n", "gr", function()
-- 		require("telescope.builtin").lsp_references(telescope_opts)
-- 	end, opts)
-- end

-- on_attach(function(client, bufnr)
--   lsp_keymaps(bufnr)
--   --  format_on_save(client, bufnr)
-- end)


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/packages/elixir-ls/language_server.sh") }
}
-- 
-- lspconfig.pyright.setup { blabla}

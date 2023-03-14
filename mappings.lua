---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["|"] = { ":vsplit<CR>", "new vertical split", opts = { nowait = true }},
    ["-"] = { ":split<CR>", "new horizontal split", opts = { nowait = true }},
    ["<leader>r"] = { ":b#<CR>", "new horizontal split", opts = { nowait = true }},
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<leader>x"] = { ":lua vim.lsp.buf.format() <CR>", "format buffer", { nowait = true }},
  },
}

-- :lua vim.lsp.buf.format()
-- more keybinds!

return M

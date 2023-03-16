---@type MappingsTable
local M = {}

M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<leader>ff"] = "",
      ["<leader>fa"] = "",
      ["<leader>fb"] = "",
      ["<leader>fh"] = "",
      ["<leader>fo"] = "",
      ["<leader>fw"] = "",
      ["<leader>f"] = "",
      ["<leader>cc"] = "",
      ["<leader>ch"] = "",
      ["<leader>cm"] = "",
      ["<leader>v"] = "",
      ["<leader>x"] = "",
      ["<leader>gt"] = "",
      ["<leader>pt"] = "",
      ["<leader>rn"] = "",
      ["<leader>th"] = "",
      ["<leader>wk"] = "",
      ["<leader>wK"] = "",
      ["<leader>b"] = "",
      ["<leader>n"] = "",
  }
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["|"] = { ":vsplit<CR>", "new vertical split", opts = { nowait = true }},
    ["-"] = { ":split<CR>", "new horizontal split", opts = { nowait = true }},
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Explorer" },
    ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", opts = { nowait = true }},
    -- ["gd"] = { "vim.lsp.buf.definition", opts = { nowait = true }},
    ["gD"] = { "<cmd>Telescope lsp_references<cr>", opts = { nowait = true }},
  },
}

-- more keybinds!

return M

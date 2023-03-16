local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- 
  -- Steve's plugins
  --
  {
    "smpallen99/nvim-coverage",
    enabled = true,
    event = "BufEnter *.ex",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("coverage").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    enabled = true,
    lazy = false,
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
--  {
--     "folke/which-key.nvim",
--     enabled = true,
--     config = function()
--       vim.o.timeout = true
--       vim.o.timeoutlen = 300
--       require("which-key").setup({
--         -- your configuration comes here
--         -- or leave it empty to use the default settings
--         -- refer to the configuration section below
--       })
--     end,
--   },
}

local wk = require("which-key")

wk.register({
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle" },
  ["q"] = { "<cmd>lua require('lvim.utils.functions').smart_quit()<CR>", "Quit" },
  ["r"] = { "<cmd>b#<cr>", "Prev Buffer"},
  ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["e"] = { "<cmd> NvimTreeToggle <CR>", "Explorer" },
  ["|"] = { ":vsplit<CR>", "New vert. split", opts = { nowait = true }},
  ["-"] = { ":split<CR>", "New horz. split", opts = { nowait = true }},
  p = {
    name = "Lazy",
    l = { ":Lazy<CR>", "Lazy", opts = { nowait = true }},
  },
  n = {
    name = "Line numbers",
    n = { "<cmd> set nu! <CR>", "Toggle line number" },
    r = { "<cmd> set rnu! <CR>", "Toggle relative number" },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  f = { "<cmd> Telescope find_files <CR>", "Find File" },
  F = {
    name = "Find",
    f = { "<cmd> Telescope find_files <CR>", "find files" },
    a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    w = { "<cmd> Telescope live_grep <CR>", "live grep" },
    b = { "<cmd> Telescope buffers <CR>", "find buffers" },
    h = { "<cmd> Telescope help_tags <CR>", "help page" },
    o = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    t = { "<cmd> Telescope terms <CR>", "pick hidden term" },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigs'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    S = { "<cmd>Git<CR>", "Fugitive" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  l = {
    name = "LSP", -- optional group name
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { ":lua vim.lsp.buf.format() <CR>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  N = {
    name = "NvChad",
    c = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    K = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    k = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
    t = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  t = {
    name = "Terminal",
    h = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    v = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
    f = {
      function()
        require("nvterm.terminal").new "float"
      end,
      "New floating term",
    },
    F = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    H = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
    V = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
  v = {
    name = "Misc",
    v = { "<cmd>version<CR>", "Version" },
    c = { "<cmd>checkhealth<CR>", "Check health" },
  },
  w = { "<cmd>w!<CR>", "Save" },
  x = {
    name = "Tabs",
    N = { "<cmd>tabedit<CR>", "New tab" },
    c = { "<cmd>tabc<CR>", "Close tab" },
    o = { "<cmd>tabo<CR>", "Close other tabs" },
    w = { "<C-w>T", "Move current to new tab" },
    g = { "<cmd>tabn", "Switch to tab num" },
    n = { "<cmd>tabn<CR>", "Next tab" },
    p = { "<cmd>tabp<CR>", "Prev tab" },
  },
}, { prefix = "<leader>" })
return plugins

local M = {}


M.disabled = {
  n = {
    ["<leader>ra"] = "", -- LSP - rename
    ["<leader>rh"] = "", -- reset hunk
    ["<leader>rn"] = "", -- toggle relative number 
    ["<leader>/"] = "", -- comment line 
  }
}

M.dap = { plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dq"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate the program",
    },
    ["<leader>di"] = {
      "<cmd> DapStepInto <CR>",
      "Step into",
    },
    ["<leader>ds"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over",
    },
    ["<leader>do"] = {
      "<cmd> DapStepOut <CR>",
      "Step Out",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}


M.doomKeyMaps= {
  n = {
    ["<leader>wh"] = {
      "<C-w>h",
      "window move left"
    },
    ["<leader>wj"] = {
      "<C-w>j",
      "window move down"
    },
    ["<leader>wk"] = {
      "<C-w>k",
      "window move up"
    },
    ["<leader>wl"] = {
      "<C-w>l",
      "window move right"
    },
    ["<leader>wc"] = {
      "<C-w>c",
      "window close"
    },
    ["<leader>ws"] = {
      "<cmd>split<CR>",
      "window split horizontal"
    },
    ["<leader>wv"] = {
      "<cmd>vsplit<CR>",
      "window split vertically"
    },
    ["<leader>pf"] = {
      "<cmd>lua require('fzf-lua').files()<CR>", "fzf search", { silent = true }
    },
    ["<leader>/"] = {
      "<cmd>lua require('fzf-lua').live_grep()<CR>", "grep search", { silent = true }
    },
    ["<leader>r"] = {
      "<cmd>lua require('fzf-lua').lsp_references()<CR>", "lsp - reference search", { silent = true }
    },
    ["<leader>si"] = {
      "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", "lsp - symbols", { silent = true }
    },
  },
  v = {
    ["<leader>/"] = {
      "<cmd>lua require('fzf-lua').grep_visual()<CR>", "grep search", { silent = true }
    },
  }
}

return M

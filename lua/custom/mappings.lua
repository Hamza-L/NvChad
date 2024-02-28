local M = {}

M.dap = {
  plugin = true,
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
      "<C-w>ws",
      "window split horizontal"
    },
    ["<leader>wv"] = {
      "<C-w>wv",
      "window split vertically"
    },
  }
}

return M

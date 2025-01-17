local M = {}


M.disabled = {
  n = {
    ["<leader>ra"] = "", -- LSP - rename
    ["<leader>rh"] = "", -- reset hunk
    ["<leader>rn"] = "", -- toggle relative number 
    ["<leader>/"] = "", -- comment line 
    ["<C-n>"] = "", -- show file tree
    ["<leader>b"] = "", -- new buffer 
    ["<leader>x"] = "", -- close buffer 
    ["<leader>fw"] = "", -- find word grep buffer 
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
    ["<leader>fw"] = {
      "<cmd>lua require('fzf-lua').lgrep_curbuf()<CR>", "fzf search", { silent = true }
    },
    ["<leader>fl"] = {
      "<cmd>lua require('fzf-lua').grep_last()<CR>", "fzf search", { silent = true }
    },
    ["<leader>pf"] = {
      "<cmd>lua require('fzf-lua').files()<CR>", "fzf search", { silent = true }
    },
    ["<leader>po"] = {
      "<cmd>ClangdSwitchSourceHeader<CR>", "switch to header/source", { silent = true }
    },
    ["<leader>pa"] = {
      "<cmd>lua require('projections.workspace').add(vim.loop.cwd())<CR>", "switch to header/source", { silent = true }
    },
    ["<leader>pp"] = {
      "<cmd>Telescope file_browser<CR>", "Project Manager", { silent = true }
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
    ["<leader>bk"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>x"] = {
       "<cmd> enew <CR>", "New buffer"
    },
    ["<leader>pc"] = {
      "<cmd>CMakeBuild<CR>", "CMake Build Project",
    },
    ["<leader>pk"] = {
      "<cmd>:FZFCMakeSelectKit<CR>", "CMake select kit",
    },
    ["<leader>pd"] = {
      "<cmd>:FZFCMakeSelectBuildType<CR>", "CMake select target",
    },
    ["<leader>pt"] = {
      "<cmd>:FZFCMakeSelectTarget<CR>", "CMake select target",
    },
    ["<leader>pwg"] = {
      '<cmd>CMake<CR>', "CMake Generate Project",
    },
    ["<leader>pr"] = {
      "<cmd>CMakeRun!<CR>", "CMake Run Project",
    },
    ["<leader>op"] = {
      "<cmd>NvimTreeToggle<CR>", "File Tree",
    },
    ["<leader>sr"] = {
      "<cmd>SessionRestore<CR>", "Session Restore",
    },
    ["<leader>ss"] = {
      "<cmd>SessionSave<CR>", "Session Save",
    },
    ["gj"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },
    ["<leader>j"] = {
      "<cmd>FzfLua jumps<CR>",
      "fzf jumps",
    },
  },
  v = {
    ["<leader>/"] = {
      "<cmd>lua require('fzf-lua').grep_visual()<CR>", "grep search", { silent = true }
    },
    ["<leader>fw"] = {
      "<cmd>lua require('fzf-lua').grep_visual_curbuf()<CR>", "fzf search", { silent = true }
    },
  }
}

return M

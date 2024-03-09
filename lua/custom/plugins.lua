local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "objc", "lua", "vim", "vimdoc", "cpp", "glsl", "json", "cmake" },
      highlight = {
        vim.api.nvim_set_hl(0, "@preproc", { fg = "#de9b5d", bold = true , italic = true }),
        vim.api.nvim_set_hl(0, "@define", { fg = "#de9b5d", bold = true , italic = true }),
        vim.api.nvim_set_hl(0, "@include", { fg = "#de9b5d", bold = true , italic = true}),
        vim.api.nvim_set_hl(0, "@parameter", { fg = "#ffffff" }),
        vim.api.nvim_set_hl(0, "@namespace", { fg = "#d1866d" }),
        vim.api.nvim_set_hl(0, "@storageclass", { fg = "#9480b4" }),
        vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#9480b4" }),
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function ()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 1, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = "VeryLazy",
    config = function()
      -- calling `setup` is optional for customization
      require('rainbow-delimiters.setup').setup({
        highlight = {
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
          'RainbowDelimiterRed',
        },     
      })
    end
  },
  {
    'nvim-treesitter/playground',
    event = "VeryLazy"
  },
  {
    'rmagatti/auto-session',
    event = "VeryLazy",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  },
  {
    "cdelledonne/vim-cmake",
    event = "VeryLazy",
    config = function()
      vim.g.cmake_link_compile_commands = 1
    end
  },
  {
    "vim-cool"
  },
  {
    "liuchengxu/vista.vim",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "junegunn/fzf", build = "./install --bin"  
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        winopts = {
          preview = {
            border = "border",
            layout = "vertical",
            vertical = "up:75%",
          },
          on_create = function()
            -- called once upon creation of the fzf main window
            -- can be used to add custom fzf-lua mappings, e.g:
          end,
        },
        keymap = {

        }
      })
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
      local dap = require('dap')
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb', -- adjust as needed, must be absolute path
        name = 'lldb'
      }
      dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          -- 💀
          -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
          --
          --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          --
          -- Otherwise you might get the following error:
          --
          --    Error on launch: Failed to attach to the target process
          --
          -- But you should be aware of the implications:
          -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
          -- runInTerminal = false,
        },
      }
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,

  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb"
      }
    }
  }
}

return plugins

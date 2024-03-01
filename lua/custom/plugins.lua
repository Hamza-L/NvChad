local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "cpp", "glsl", "json", "cmake" },
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
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'nvim-treesitter/playground',
    event = "VeryLazy"
  },
  {
    "vim-cool"
  },
  {
    "cdelledonne/vim-cmake",
    event = "VeryLazy",
  },
  {
    "liuchengxu/vista.vim",
    event = "VeryLazy",
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
        },
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

---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'kanagawa',

  statusline = {
    overriden_modules = function(modules)
      modules[2] = (function()
        local config = require("core.utils").load_config().ui.statusline
        local sep_style = config.separator_style

        local default_sep_icons = {
          default = { left = "", right = " " },
          round = { left = "", right = "" },
          block = { left = "█", right = "█" },
          arrow = { left = "", right = "" },
        }

        local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

        local sep_r = separators["right"]
        local icon = " 󰈚 "
        local name = vim.fn.expand("%:.")

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or ""
          end

          name = " " .. name .. " "
        end

        return "%#St_file_info#" .. icon .. name .. "%#St_file_sep#" .. sep_r
      end)()
    end,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File", "Spc p f", "fzf find files" },
      { "  Project Manager", "Spc p p", "Open file navigator" },
      { "󰈚  Recent Files", "Spc s r", "Restore Session" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  hl_override = {
    NvDashAscii = {bg = "NONE" , fg = "blue"},
    vim.api.nvim_set_hl(0, "@preproc", { fg = "#de9b5d" }),
    vim.api.nvim_set_hl(0, "@define", { fg = "#de9b5d" }),
    vim.api.nvim_set_hl(0, "@include", { fg = "#de9b5d" }),
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#ffffff" }),
    vim.api.nvim_set_hl(0, "@namespace", { fg = "#d17176" }),
  }
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M

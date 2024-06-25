local M = {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

function M.config()
  require("nightfox").setup({
    options = {
      -- Compiled file's destination location
      compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      compile_file_suffix = "_compiled", -- Compiled file suffix
      transparent = false, -- Disable setting background
      terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false, -- Non focused panes set to alternative background
      module_default = true, -- Default enable value for modules
      colorblind = {
        enable = false, -- Enable colorblind support
        simulate_only = true, -- Only show simulated colorblind colors and not diff shifted
        severity = {
          --protan = 1, -- Severity [0,1] for protan (red)
          deutan = 1, -- Severity [0,1] for deutan (green)
          --tritan = 1, -- Severity [0,1] for tritan (blue)
        },
      },
      styles = { -- Style to be applied to different syntax groups
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "italic",
        constants = "italic",
        functions = "italic",
        keywords = "italic",
        numbers = "italic",
        operators = "italic",
        strings = "italic",
        types = "italic, bold",
        variables = "italic",
      },
      inverse = { -- Inverse highlight for different types
        match_paren = true,
        visual = true,
        search = true,
      },
      modules = { -- List of various plugins and additional options
        -- ...
      },
    },
    palettes = {
      -- Custom duskfox with black background
      duskfox = {
        bg1 = "#000000", -- Black background
        bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
        bg3 = "#121820", -- 55% darkened from stock
        sel0 = "#131b24", -- 55% darkened from stock
      },
    },
    specs = {
      all = {
        inactive = "bg0", -- Default value for other styles
      },
      duskfox = {
        inactive = "#090909", -- Slightly lighter then black background
      },
    },
    groups = {
      all = {
        NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
      },
    },
  })
  vim.cmd([[colorscheme nightfox]])
end

return M

return {

  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",

      "rcarriga/nvim-notify",
    },
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = true,
      }
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[║


kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkbbbbbbbbkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkiiiikb::::::bkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkttttkkkkkkkkkkkkkkk
k::::::kkkkkkkkkkkkki::::ib::::::bkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkttt:::tkkkkkkkkkkkkkkk
k::::::kkkkkkkkkkkkkkiiiikb::::::bkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkt:::::tkkkkkkkkkkkkkkk
k::::::kkkkkkkkkkkkkkkkkkkkb:::::bkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkt:::::tkkkkkkkkkkkkkkk
kk:::::kkkkkkkkkkkkiiiiiiikb:::::bbbbbbbbbkkkkkkkkeeeeeeeeeeeekkkkttttttt:::::tttttttkkkkkkkkk
kk:::::kkkkk:::::kki:::::ikb::::::::::::::bbkkkkee::::::::::::eekkt:::::::::::::::::tkkkkkkkkk
kk:::::kkkk:::::kkkki::::ikb::::::::::::::::bkke::::::eeeee:::::eet:::::::::::::::::tkkkkkkkkk
kk:::::kkk:::::kkkkki::::ikb:::::bbbbb:::::::be::::::ekkkkke:::::etttttt:::::::ttttttkkkkkkkkk
kk::::::k:::::kkkkkki::::ikb:::::bkkkkb::::::be:::::::eeeee::::::ekkkkkkt:::::tkkkkkkkkkkkkkkk
kk:::::::::::kkkkkkki::::ikb:::::bkkkkkb:::::be:::::::::::::::::ekkkkkkkt:::::tkkkkkkkkkkkkkkk
kk:::::::::::kkkkkkki::::ikb:::::bkkkkkb:::::be::::::eeeeeeeeeeekkkkkkkkt:::::tkkkkkkkkkkkkkkk
kk::::::k:::::kkkkkki::::ikb:::::bkkkkkb:::::be:::::::ekkkkkkkkkkkkkkkkkt:::::tkkkkttttttkkkkk
k::::::kkk:::::kkkki::::::ib:::::bbbbbb::::::be::::::::ekkkkkkkkkkkkkkkkt::::::tttt:::::tkkkkk
k::::::kkkk:::::kkki::::::ib::::::::::::::::bkke::::::::eeeeeeeekkkkkkkktt::::::::::::::tkkkkk
k::::::kkkkk:::::kki::::::ib:::::::::::::::bkkkkee:::::::::::::ekkkkkkkkkktt:::::::::::ttkkkkk
kkkkkkkkkkkkkkkkkkkiiiiiiiibbbbbbbbbbbbbbbbkkkkkkkeeeeeeeeeeeeeekkkkkkkkkkkktttttttttttkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk


      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "hyper",
        hide = {
          statusline = true,
        },
        config = {
          header = vim.split(logo, "\n"),
          footer = {},
        },
      }

      return opts
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}

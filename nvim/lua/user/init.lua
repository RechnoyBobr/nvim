return {
  lsp = {
    skip_setup = { "clangd" },
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
  },
  mappings = {
    n = {
      ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close(0)
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
      },
    },
  },
  colorscheme = "monokai-pro",
  plugins = {
    --disabling core plugins
    {
      "p00f/clangd_extensions.nvim",
      event = "User AstroLspSetup",
      opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
    },
    { "joukevandermaas/vim-ember-hbs", lazy = false },
    {
      "loctvl842/monokai-pro.nvim",
      lazy = false,
      config = function()
        require("monokai-pro").setup {
          transparent_background = true,
          terminal_colors = true,
          devicons = true, -- highlight the icons of `nvim-web-devicons`
          styles = {
            comment = { italic = true },
            keyword = { italic = true }, -- any other keyword
            type = { italic = true }, -- (preferred) int, long, char, etc
            storageclass = { italic = true }, -- static, register, volatile, etc
            structure = { italic = true }, -- struct, union, enum, etc
            parameter = { italic = true }, -- parameter pass in function
            annotation = { italic = true },
            tag_attribute = { italic = true }, -- attribute of tag in reactjs
          },
          filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
          -- Enable this will disable filter option
          day_night = {
            enable = false, -- turn off by default
            day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
            night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
          },
          inc_search = "background", -- underline | background
          background_clear = {
            -- "float_win",
            "toggleterm",
            "telescope",
            "which-key",
            "neo-tree",
          }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
          plugins = {
            bufferline = {
              underline_selected = false,
              underline_visible = false,
            },
            indent_blankline = {
              context_highlight = "default", -- default | pro
              context_start_underline = false,
            },
          },
        }
      end,
    },
    {
      "NvChad/nvim-colorizer.lua",
      lazy = false,
      config = function()
        require("colorizer").setup {
          filetypes = { "*" },
          user_default_options = {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            names = true, -- "Name" codes like Blue or blue
            RRGGBBAA = false, -- #RRGGBBAA hex codes
            AARRGGBB = false, -- 0xAARRGGBB hex codes
            rgb_fn = true, -- CSS rgb() and rgba() functions
            hsl_fn = true, -- CSS hsl() and hsla() functions
            css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            -- Available modes for `mode`: foreground, background,  virtualtext
            mode = "foreground", -- Set the display mode.
            -- Available methods are false / true / "normal" / "lsp" / "both"
            -- True is same as normal
            tailwind = true, -- Enable tailwind colors
            -- parsers can contain values used in |user_default_options|
            sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
            virtualtext = "■",
            -- update color values even if buffer is not focused
            -- example use: cmp_menu, cmp_docs
            always_update = true,
          },
          -- all the sub-options of filetypes apply to buftypes
          buftypes = {},
        }
      end,
    },
    {
      "folke/which-key.nvim",
      lazy = false,
      config = function()
        require("which-key").setup {
          window = {
            border = "single",
          },
        }
      end,
    },
    { "rcarriga/nvim-notify", config = function() background_color = "#000000" end },
  },
}

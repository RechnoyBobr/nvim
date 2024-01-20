return {
<<<<<<< HEAD
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = true,
=======
  { "smjonas/inc-rename.nvim", cmd = "IncRename", config = true },
  { "kaarmu/typst.vim", ft = "typst", lazy = false },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "0.1.*",
    build = function()
      require("typst-preview").update()
    end,
  },
>>>>>>> 8bac8dc (Typst upgrade)
}

return {
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
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
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = function(_, opts)
            require("colorizer").setup({
                "*",
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
}

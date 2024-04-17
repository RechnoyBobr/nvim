-- booktstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
    vim.o.guifont = "Agave Nerd Font Mono"
    vim.g.neovide_transparency = 0.8
end

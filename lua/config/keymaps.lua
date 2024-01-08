-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("config.bobster.discipline")
discipline.cowboy()
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("i", "jk", "<Esc>")

--Select all

keymap.set("n", "<C-a>", "gg<S-v>G")

-- tabs

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<F7>", ":ToggleTerm direction=float<CR>")
keymap.set("n", "<F7>", ":ToggleTerm direction=float<CR>" .. [[<C-\><C-n>]] .. "i", { noremap = true, silent = true })
keymap.set("t", "<F7>", [[<C-\><C-n>]] .. ":ToggleTerm<CR>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("i", "<Tab>", "<Nop>")
keymap.set("", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

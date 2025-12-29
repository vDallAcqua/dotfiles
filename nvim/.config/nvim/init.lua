-- BOOTSTRAP LAZY.NVIM (Installazione automatica plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- CONFIGURAZIONE
require("lazy").setup({
  -- Installazione Tema base
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- La base più scura
        transparent = false, -- Usa il nostro colore di sfondo
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_colors = function(colors)
          -- OVERRIDE STARLIGHT
          colors.bg = "#16161e"      -- Sfondo Void
          colors.bg_dark = "#16161e" -- Sfondo sidebar
          colors.bg_float = "#16161e"-- Sfondo popup
          colors.fg = "#c0caf5"      -- Testo base
        end,
        on_highlights = function(hl, c)
            -- Linea numero corrente color Oro
            hl.CursorLineNr = { fg = "#e0af68", bold = true }
            -- Cursore color Oro (simulato)
            hl.Cursor = { bg = "#e0af68", fg = "#16161e" }
        end,
      })
      -- Attiva il tema
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
  
  -- Qui potrai aggiungere Treesitter o LSP in futuro
})

-- OPZIONI BASE (Minimalismo)
vim.opt.number = true         -- Numeri riga
vim.opt.relativenumber = true -- Numeri relativi (utile per salti)
vim.opt.termguicolors = true  -- Colori veri 24-bit
vim.opt.cursorline = true     -- Evidenzia riga corrente
vim.opt.clipboard = "unnamedplus" -- Usa la clipboard di sistema (wl-clipboard)

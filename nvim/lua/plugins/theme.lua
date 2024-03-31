return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 100,
    config = function()
      require("poimandres").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "poimandres",
    },
  },
}
-- return {
--   {
--     "catppuccin/nvim",
--     lazy = true,
--     name = "catppuccin",
--     config = function()
--       require("catppuccin").setup({
--         flavour = "macchiato",
--         term_colors = true,
--         no_italic = false,
--         no_bold = false,
--         transparent_background = false,
--       })
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

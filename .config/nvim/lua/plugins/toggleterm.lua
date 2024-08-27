return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = { { "<c-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" } },
    opts = {
      open_mapping = [[<c-t>]],
      direction = "float",
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      shade_filetypes = {},
    },
  },
}

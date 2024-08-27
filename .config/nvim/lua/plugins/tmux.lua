return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<CR>",  desc = "Window left" },
      { "<c-j>", "<cmd>TmuxNavigateDown<CR>",  desc = "Window down" },
      { "<c-k>", "<cmd>TmuxNavigateUp<CR>",    desc = "Window up" },
      { "<c-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Window right" },
    },
  },
}

return {
  "ChristianChiarulli/bookmark.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
  },
  keys = {
    { "<leader>mt", "<cmd>BookmarkToggle<CR>", desc = "Toggle bookmark" },
    { "<leader>mn", "<cmd>BookmarkPrev<CR>", desc = "Previous bookmark" },
    { "<leader>mp", "<cmd>BookmarkNext<CR>", desc = "Next bookmark" },
    { "<leader>ma", "<cmd>BookmarkClearProject<CR>", desc = "Clear all bookmarks" },
    { "<leader>mc", "<cmd>BookmarkClear<CR>", desc = "Clear all bookmarks in file" },
    { "<leader>ml", "<cmd>BookmarkList<CR>", desc = "List bookmarks" },
  },
  opts = {
    sign = "",
    highlight = "Function",
    file_sign = "󱡅",
    file_highlight = "Function",
  },
  config = function(_, opts)
    require("bookmark").setup(opts)
    require("telescope").load_extension("bookmark")
  end,
}

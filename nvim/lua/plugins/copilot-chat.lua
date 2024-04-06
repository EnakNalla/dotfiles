return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    keys = {
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Enter a message: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Ask copilot a question",
      },
      { "<leader>ao", "<cmd>CopilotChatOpen<CR>", desc = "Open chat" },
      { "<leader>afc", "<cmd>CopilotChatFix<CR>", desc = "Ask copilot to fix code" },
      { "<leader>afd", "<cmd>CopilotChatFixDiagnostic<CR>", desc = "Ask copilot to fix diagnostic" },
      { "<leader>aO", "<cmd>CopilotChatOptimize<CR>", desc = "Ask copilot to optomize code" },
    },
    opts = {},
  },
}

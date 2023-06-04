return {
  "zbirenbaum/copilot-cmp",
  opts = {
    formatters = {
      insert_text = require("copilot_cmp.format").remove_existing,
    },
  },
}

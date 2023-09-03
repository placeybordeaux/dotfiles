return {
  { "kassio/neoterm" },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}

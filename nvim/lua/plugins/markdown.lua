return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  keys = {
    {
      "<leader>cp",
      function()
        require("peek").open()
      end,
    },
  },
}

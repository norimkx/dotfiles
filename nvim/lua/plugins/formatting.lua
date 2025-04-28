return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          append_args = { "--trailing-comma", "es5" },
        },
      },
    },
  },
}

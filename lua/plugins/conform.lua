return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      rubocop = {
        command = "mise",
        prepend_args = { "exec", "--", "bundle", "exec", "rubocop" },
      },
    },
  },
}

require("nvim-tree").setup {
  filters = {
    dotfiles = false,
    custom = {"^\\.git", "node_modules"},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
}

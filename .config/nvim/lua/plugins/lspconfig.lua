return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "golangci-lint",
        "eslint_d",
        "gopls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        rust_analyzer = {},
        golangci_lint_ls = {},
        gopls = {},
        eslint = {},
      },
    },
  },
}

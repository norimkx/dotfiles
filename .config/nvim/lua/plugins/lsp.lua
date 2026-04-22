return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "powershell-editor-services",
        "typos-lsp",
      },
    },
  },
  {
    "TheLeoP/powershell.nvim",
    opts = {
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    },
  },
}

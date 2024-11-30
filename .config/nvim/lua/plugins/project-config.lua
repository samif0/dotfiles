return {
  {
    "folke/neoconf.nvim",
    opts = {
      -- Import the recommended settings
      import = {
        vscode = true,    -- import VS Code settings if present
        coc = true,       -- import COC settings if present
        nlsp = true,      -- import nlsp-settings if present
      },
    },
  },
}
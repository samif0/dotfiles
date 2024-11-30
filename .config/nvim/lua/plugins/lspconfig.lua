return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "gopls",                -- Go
        "rust-analyzer",        -- Rust
        "jdtls",               -- Java
        "clangd",              -- C/C++
        -- Linters
        "golangci-lint",
        "shellcheck",
        -- Formatters
        "gofumpt",             -- Stricter Go formatting
        "goimports",           -- Go import organization
        "clang-format",        -- C/C++ formatting
        "stylua",              -- Lua formatting
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- Enable this to show formatters used in a notification
      format_notify = false,
      servers = {
        -- Go configuration
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
        -- Rust configuration
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
                extraArgs = {"--all-features"},
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
            },
          },
        },
        -- Java configuration
        jdtls = {},
        -- C/C++ configuration
        clangd = {},
      },
      setup = {
        -- Example of configuring a language server post-setup
        tsserver = function(_, opts)
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client.name == "tsserver" then
                client.server_capabilities.documentFormattingProvider = false
              end
            end,
          })
        end,
        -- Go setup
        gopls = function(_, opts)
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              local params = vim.lsp.util.make_range_params()
              params.context = {only = {"source.organizeImports"}}
              -- buf_request_sync defaults to a 1000ms timeout. Depending on your
              -- machine and codebase, you might want to increase this.
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
              for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
                  end
                end
              end
            end
          })
        end,
      },
    },
  },
}
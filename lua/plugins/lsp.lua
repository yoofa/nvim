return {
  -- disable neodev
  { "folke/neodev.nvim", enabled = false },

  -- lazydev
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

  -- tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clang-format",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        -- "deno",
        "shfmt",
        "black",
        "isort",
        "flake8",
      })
    end,
  },

  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    enabled = true,
    opts = {
      ui = {
        code_action = "󰌶",
        diagnostic = "",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      diagnostics = {
        -- disable virtual text
        virtual_text = false,
        virtual_lines = {
          -- Only show virtual line diagnostics for the current cursor line
          current_line = true,
        },
      },
      inlay_hints = { enabled = true },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      servers = {
        -- clangd
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "-j=12",
            "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
            "--clang-tidy",
            "--clang-tidy-checks=*",
            "--all-scopes-completion",
            "--cross-file-rename",
            "--completion-style=detailed",
            "--header-insertion-decorators",
            "--header-insertion=iwyu",
            "--pch-storage=memory",
          },
          single_file_support = true,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
        },
        --
      },
    },
  },

  {
    "stevearc/conform.nvim",
    enabled = true,
    optional = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        markdown = { "prettierd", "prettier" },
        markdown_mdx = { "prettierd", "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        cpp = { "clang_format" },
        c = { "clang_format" },
        java = { "google-java-format" },
        gn = { "gn" },
        bp = { "bpfmt" },
        python = { "black" },
        rust = { "rustfmt" },
        go = { "gopls" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        dprint = {
          condition = function(ctx)
            return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    enabled = true,
    opts = {
      linters_by_ft = {
        lua = { "selene", "luacheck" },
        markdown = { "markdownlint" },
      },
      linters = {
        selene = {
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
        luacheck = {
          condition = function(ctx)
            return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },

  -- inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    enabled = false,
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
      require("lsp-inlayhints").setup(opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, args.buf)
        end,
      })
    end,
  },
}

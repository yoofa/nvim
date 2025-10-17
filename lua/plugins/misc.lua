if false then
  return {}
end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "LazyFile", "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      -- Modern matchit and matchparen
      {
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_offscreen = {}
        end,
      },

      -- Wisely add "end" in various filetypes
      --"RRethy/nvim-treesitter-endwise",
    },
    opts = {
      ensure_installed = {
        "bp",
        "c",
        "cpp",
        -- "gn",
        "java",
        "lua",
        "python",
        "tsx",
        "typescript",
      },
      highlight = { enable = true },
      indent = { enable = true },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
      },
      sync_install = true,
      auto_install = true,
    },

    ---@diagnostic disable-next-line: undefined-doc-name
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@diagnostic disable-next-line: inject-field
        opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- log highlight
  {
    "fei6409/log-highlight.nvim",
    -- enabled = false,
    event = "BufRead *.log",
    opts = {},
  },

  { "nvim-tree/nvim-tree.lua" },

  -- add vim-wakatime
  { "wakatime/vim-wakatime", enabled = false, event = "VeryLazy" },

  -- code snapshot
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>cx", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      save_path = "~/Pictures",
      has_breadcrumbs = false,
      bg_theme = "bamboo",
      min_width = 0,
    },
  },

  -- highlight undo
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      ...,
    },
  },
}

if false then
  return {}
end

return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = { ["*"] = true },
    },
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- gn syntax
  { "kalcutter/vim-gn" },

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
    keys = function()
      return {}
    end,
    event = "VeryLazy",
  },

  { "rafamadriz/friendly-snippets", event = "VeryLazy" },

  {
    "garymjr/nvim-snippets",
    event = "VeryLazy",
    enabled = true,
    opts = {
      -- create_cmp_source = true,
      -- friendly_snippets = false, -- LazyVim has this covered another way
      -- search_paths = {
      --   vim.fn.stdpath("config") .. "/snippets",
      -- },
    },
  },

  { "aperezdc/vim-template" },

  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        cpp = {
          "cd $dir &&",
          "clang++ $fileName --std=c++2b",
          "-fsanitize=address -fsanitize=undefined -fsanitize=leak",
          "-o /tmp/$fileNameWithoutExt &&",
          "/tmp/$fileNameWithoutExt",
        },
      },
    },
  },
}

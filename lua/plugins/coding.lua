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
    keys = function()
      return {}
    end,
    event = "VeryLazy",
  },

  { "rafamadriz/friendly-snippets", event = "VeryLazy" },

  { "aperezdc/vim-template" },
}

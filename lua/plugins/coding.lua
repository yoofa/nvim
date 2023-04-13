if false then
  return {}
end

return {
  { "kalcutter/vim-gn" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "<CurrentMajor>.*",
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp",
  },
  { "rafamadriz/friendly-snippets" },

  { "aperezdc/vim-template" },
}

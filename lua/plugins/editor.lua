#! /usr/bin/env lua
--
-- editor.lua
-- Copyright (C) 2024 youfa <vsyfar@gmail.com>
--
-- Distributed under terms of the GPLv2 license.
--

return {
  -- symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
    opts = { auto_close = true, position = "right" },
  },
}

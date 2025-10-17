#! /usr/bin/env lua
--
-- leetcode.lua
-- Copyright (C) 2024 youfa <vsyfar@gmail.com>
--
-- Distributed under terms of the GPLv2 license.
--

local user_config = require("utils.dynamic_config")

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },

  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
      },
      { "luarocks.nvim" },
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "norg" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = "normal",
    },
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "cpp",
      cn = { -- leetcode.cn
        enabled = true, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
      },
      injector = { ---@type table<lc.lang, lc.inject>
        ["python3"] = {
          before = true,
        },
        ["cpp"] = {
          before = { '#include "lc.h"' },
          after = { "int main(int argc, char** argv) {", "  Solution sol;", " return 0;", "}" },
        },
        ["java"] = {
          before = "import java.util.*;",
        },
      },
      storage = {
        home = user_config.leetcode_home,
        cache = vim.fn.stdpath("cache") .. "/leetcode",
      },
      image_support = true,
    },
  },
}

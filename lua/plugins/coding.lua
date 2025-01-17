if false then
  return {}
end

return {

  { import = "lazyvim.plugins.extras.ai.copilot" },
  { import = "lazyvim.plugins.extras.ai.copilot-chat" },

  -- gn syntax
  { "kalcutter/vim-gn" },

  -- snippets
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
    "aperezdc/vim-template",
    init = function()
      vim.g.templates_directory = vim.fn.stdpath("config") .. "/templates"
    end,
    config = function()
      vim.cmd([[
        function! GetGuard()
          " 获取文件名和路径
          let filename = expand('%:t')
          let filepath = expand('%:p')
          " 获取项目根目录名（假设是git仓库）
          let project_dir = system('git -C ' . fnamemodify(filepath, ':h') . ' rev-parse --show-toplevel')
          let project_name = fnamemodify(substitute(project_dir, '\n\+$', '', ''), ':t')
          " 如果不在git仓库中，使用当前目录名
          if v:shell_error
            let project_name = fnamemodify(getcwd(), ':t')
          endif
          " 转换为大写
          let filename = toupper(filename)
          let project_name = toupper(project_name)
          " 替换非字母数字的字符为下划线
          let filename = substitute(filename, '\W\+', '_', 'g')
          let project_name = substitute(project_name, '\W\+', '_', 'g')
          " 构造guard字符串
          let guard = 'AVE_' . project_name . '_' . filename . '_H_'
          " 使用vim.notify发送通知
          " call luaeval('vim.notify(_A[1], vim.log.levels.INFO, { title = "Generated Guard" })', [guard])
          return guard
        endfunction
      ]])

      -- 设置用户变量
      vim.g.templates_user_variables = {
        { "AVE_GUARD", "GetGuard" },
      }
    end,
  },

  -- todo
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    -- event = "LazyFile",
  },

  -- code runner
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

  --  avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    enabled = false,
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

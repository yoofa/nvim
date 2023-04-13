-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.nvim-tree")

require("config.formatting").configure_format_on_save()

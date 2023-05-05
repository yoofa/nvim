-- No need to use, null-ls is responsoble for format files
if true then
  return {}
end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add neoformat
  {
    "sbdchd/neoformat",
    --     opts = function(_, opts)
    --       require("config.formatting").configure_format_on_save()
    --     end,
  },
}

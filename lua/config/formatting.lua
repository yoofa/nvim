local M = {}
local options = require("config.options")
local format_on_save = options.format_on_save

vim.api.nvim_create_user_command("FormatToggle", function()
  M.toggle_format_on_save()
end, {})

function M.enable_format_on_save(is_configured)
  vim.api.nvim_create_augroup("format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "format_on_save",
    callback = function()
      vim.cmd("Neoformat")
    end,
  })

  if not is_configured then
    vim.notify("Successfully enabled format-on-save", vim.log.levels.INFO, { title = "Settings modification success!" })
  end
end

function M.disable_format_on_save()
  pcall(vim.api.nvim_del_augroup_by_name, "format_on_save")

  if format_on_save then
    vim.notify("Disabled format-on-save", vim.log.levels.INFO, { title = "Settings modification success!" })
  end
end

function M.configure_format_on_save()
  if format_on_save then
    M.enable_format_on_save(true)
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  local status = pcall(vim.api.nvim_get_autocmds, {
    group = "format_on_save",
    event = "BufWritePre",
  })
  if not status then
    M.enable_format_on_save(false)
  else
    M.disable_format_on_save()
  end
end

return M

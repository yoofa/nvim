local M = {}

-- default config
M.autoformat_filetypes = { "md" } -- at least need one
M.leetcode_home = "/tmp/leetcode"
M.enable_image = true
M.enable_waka_time = true

-- trye to load from local_config.lua
local status, local_config = pcall(require, "utils.local_config")
if status and local_config then
  for key, value in pairs(local_config) do
    M[key] = value
  end
end

return M

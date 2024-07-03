-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.o.background = "light" -- "dark"
-- if vim.
--

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.env.HOME = "C:/Users/oney"
end

require("config.lazy")

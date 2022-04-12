local status_ok, color_scheme = pcall(require, 'kanagawa')
if not status_ok then
  return
end

require('kanagawa').setup({})

require('kanagawa').load()

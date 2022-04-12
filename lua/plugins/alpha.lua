local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' ' .. datetime
end


-- Banner
local banner = {
"",
"",
"",
"",
"",
"",
"",
"",
"",
"███╗   ███╗ █████╗ ██╗███╗   ███╗ █████╗ ██████╗ ",
"████╗ ████║██╔══██╗██║████╗ ████║██╔══██╗██╔══██╗",
"██╔████╔██║███████║██║██╔████╔██║███████║██████╔╝",
"██║╚██╔╝██║██╔══██║██║██║╚██╔╝██║██╔══██║██╔═══╝ ",
"██║ ╚═╝ ██║██║  ██║██║██║ ╚═╝ ██║██║  ██║██║     ",
"╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', "  Find file", ":cd $HOME/Workspaces | Telescope find_files<CR>"),
  dashboard.button('r', "  Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

-- quote
table.insert(dashboard.config.layout, { type = "padding", val = 1 })
table.insert(dashboard.config.layout, {
  type = "text",
  val = require "alpha.fortune"(),
  opts = {
    position = "center",
    hl = "AlphaQuote",
  },
})


alpha.setup(dashboard.config)




-- hide tabline and statusline on startup screen
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=3 noruler setlocal nofoldenable",
})


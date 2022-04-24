local lualine = require('lualine')

lualine.setup {
  options = {
	icons_enabled = true,
    theme = 'pywal-nvim',
	disabled_filetypes= {"alpha", "dashboard", "NvimTree", "Outline" },
  },
}

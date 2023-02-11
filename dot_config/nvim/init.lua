--calling the impatient neovim plugin
require('impatient')
require "lsp_signature".setup()

--calling my config files
require("mirage.options") -- has settings
require("mirage.keymaps") -- custom keymaps
require("mirage.plugins") -- plugin / packer config
require("mirage.colorscheme") --vim.cmd "colorscheme wal"
--vim.cmd "colorscheme hatsunemiku"
require("mirage.drpc") -- discord rpc settings
require("mirage.cmp") -- code completion
require("mirage.lsp") -- lsp config
require("mirage.telescope") --telescopee
require("mirage.treesitter") --tressitter
require("mirage.autopair") --quote and parenthesis completion
require("mirage.comment") --comment hotkey
require("mirage.gitsigns") --git changes,modification and removal indicator
require("mirage.nvim-tree") --nvim-tree config
require("mirage.bufferline") --bufferline, buffers are like  tabs
require("mirage.lualine") --statusline
require("mirage.blankline") --blankline
require("mirage.alpha") --startup dashboard
require("mirage.project")--project management

---vimscript shit
vim.g["vimtex_view_method"] = " zathura"

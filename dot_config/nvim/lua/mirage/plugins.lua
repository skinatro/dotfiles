local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Packer Not Found Or Some Error With Packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here

return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("lewis6991/impatient.nvim") --improve plugin load speed
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("andweeb/presence.nvim") --discord rich presence
	use("lervag/vimtex") --vim plugin
	use("windwp/nvim-autopairs") --autopair integration with cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("lewis6991/gitsigns.nvim") --git
	use("kyazdani42/nvim-tree.lua") --nvim tree
	use("kyazdani42/nvim-web-devicons") --fancy icons
	use("akinsho/bufferline.nvim") --bufferline tab
	use("moll/vim-bbye") --buffer delete
	use("ellisonleao/glow.nvim") --markdown previewer
	use("itchyny/vim-cursorword") --underline
	use("lukas-reineke/indent-blankline.nvim") --blankline nvim
	use("goolord/alpha-nvim") --dashboard plugin
	use("ray-x/lsp_signature.nvim") --function signature
	use("xiyaowong/nvim-transparent") --transparency baby
	use("mfussenegger/nvim-dap") --debugging server
	use("jbyuki/one-small-step-for-vimkind") --neovim lua debugger
	use("ahmedkhalf/project.nvim") --project management
	use("folke/which-key.nvim") --to show keymaps

	use({
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	}) --jumping

	use({
		"wfxr/minimap.vim",
		run = "cargo install --locked code-minimap",
		-- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
		end,
	}) --add scroll

	use({
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	}) --jump to a line

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}) --statusline

	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			local autosave = require("autosave")
			autosave.setup({
				enabled = true,
				execution_message = "autosaved at : " .. vim.fn.strftime("%H:%M:%S"),
				events = { "InsertLeave", "TextChanged" },
				conditions = {
					exists = true,
					filetype_is_not = {},
					modifiable = true,
				},
				clean_command_line_interval = 2500,
				on_off_commands = true,
				write_all_buffers = false,
			})
		end,
	})

	--Telescope Plugins
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	}) --Telescope fuzzy finder
	use("nvim-telescope/telescope-symbols.nvim") -- enter symbols for math/latex using telescope

	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")

	--colorscheme plugins
	use({ "AlphaTechnolog/pywal.nvim", as = "pywal" }) --Pywal colorscheme
	use("lunarvim/colorschemes")
	use("4513ECHO/vim-colors-hatsunemiku")

	--snippers
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") --lsp nvim completions
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" }) -- git nvim completions
	use("hrsh7th/cmp-nvim-lua") --nvim lua runtime completion

	--LSP
	use("neovim/nvim-lspconfig") --enable LSP
	use("williamboman/nvim-lsp-installer") -- LSP installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

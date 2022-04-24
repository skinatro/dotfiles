local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mirage.lsp.lsp-installer")
require("mirage.lsp.handlers").setup()
require "mirage.lsp.null-ls"

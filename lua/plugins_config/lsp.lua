-- lsp-zero
local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- lsp config
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "pyright" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- lsp keymaps
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
	}),
})

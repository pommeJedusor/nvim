local Terminal = require("toggleterm.terminal").Terminal

-- default parameter
require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	persist_size = false,
	persist_mode = false,
})

-- float terminal
local float_terminal = Terminal:new({
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	-- function to run on opening the terminal
	on_open = function(term)
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function _float_terminal_toggle()
	float_terminal:toggle()
end

-- vertical terminal
local vertical_terminal = Terminal:new({
	dir = "git_dir",
	direction = "vertical",
})
function _vertical_terminal_toggle()
	vertical_terminal:toggle()
end

-- horizontal terminal
local horizontal_terminal = Terminal:new({
	dir = "git_dir",
	direction = "horizontal",
})
function _horizontal_terminal_toggle()
	horizontal_terminal:toggle()
end

-- keymaps
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-n>", _float_terminal_toggle, opts)
end

-- set keymaps for terminals
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>lua _float_terminal_toggle()<CR>", { noremap = true, silent = true })

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

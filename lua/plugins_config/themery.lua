vim.keymap.set('n', '<leader>th', ":Themery<CR>", { desc = 'Themery' })
require("themery").setup({
  themes = {"tokyonight", "dracula", "solarized", "onedark", "monokai", "catppuccin", "material", "OceanicNext"}, -- list of installed colorschemes.
  livePreview = true,
})

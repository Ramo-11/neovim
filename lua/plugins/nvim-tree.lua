return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1

		-- change arrows color in the tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		require("nvim-tree").setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "→",
							arrow_open = "↓",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}

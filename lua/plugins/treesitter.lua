return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "html", "css", "java", "python", "cpp", "c", "kotlin" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

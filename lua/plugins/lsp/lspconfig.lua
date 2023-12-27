return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"efm",
					"lua_ls",
					"html",
					"cssls",
					"bashls",
					"dockerls",
					"gradle_ls",
					"jsonls",
					"jdtls",
					"kotlin_language_server",
					"tsserver",
					"pyright",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local conf = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local signs = { Error = " ", Warn = " ", Hint = "H", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local on_attach = function(_, _)
				vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {}) -- show definition, references
				vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {}) -- got to declaration
				vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {}) -- see definition and make edits in window
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {}) -- go to implementation
				vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {}) -- see available code actions
				vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {}) -- smart rename
				vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", {}) -- show  diagnostics for line
				-- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {}) -- show diagnostics for cursor
				vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {}) -- jump to previous diagnostic in buffer
				vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", {}) -- jump to next diagnostic in buffer
				vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {}) -- show documentation for what is under cursor
				vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", {}) -- see outline on right hand side
			end

			conf.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			conf.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.bashls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.clangd.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
			})
			conf.dockerls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.gradle_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.jsonls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.jdtls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.kotlin_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			conf.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}

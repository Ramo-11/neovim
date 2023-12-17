return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "efm", "lua_ls", "html", "cssls", "bashls", "clangd", "dockerls", "gradle_ls",
                "jsonls", "jdtls", "kotlin_language_server", "tsserver", "pyright"
            },
            automatic_installation = true
        })
    end
}
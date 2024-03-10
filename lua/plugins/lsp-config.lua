return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			--	local mod_cache = "C:\\Users\\abhip\\go\\pkg\\mod"
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"gopls",
					"golangci_lint_ls",
					"jsonls",
					"tsserver",
					"pyright",
					"tailwindcss",
				},
				automatic_installation = true,
			})
			local opts = { noremap = true, silent = true }
			local on_attach = function(_, bufnr)
				opts.buffer = bufnr

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end

			local lspc = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")
			lspc.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspc.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })
			lspc.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				--cmd = { "gopls" },
				--fileTypes = { "go", "gowork", "gomod", "gotmpl" },
				root_dir = function(fname)
					-- see: https://github.com/neovim/nvim-lspconfig/issues/804
					local mod_cache = vim.trim(vim.fn.system("go env GOMODCACHE"))
					if fname:sub(1, #mod_cache) == mod_cache then
						local clients = vim.lsp.get_active_clients({ name = "gopls" })
						if #clients > 0 then
							return clients[#clients].config.root_dir
						end
					end
					return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
				end,
				--[[settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },]]
				--
			})
		end,
	},
}

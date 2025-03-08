return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"zbirenbaum/copilot.lua",
			opts = {
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-j>",
						accept_word = "<C-k>",
						next = "<C-[>",
						prev = "<C-]>",
						dismiss = false,
					},
				},
				panel = { enabled = false },
			},
		},
		{ "zbirenbaum/copilot-cmp", opts = {} },
	},
	init = function()
		vim.opt.signcolumn = "yes"

		local lspconfig_defaults = require("lspconfig").util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local bufnr = event.buf

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { desc = "[G]o to [D]efinition", buffer = bufnr })
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, { desc = "[H]over", buffer = bufnr })
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, { desc = "[R]ename", buffer = bufnr })
				vim.keymap.set("n", "<leader>gr", function()
					vim.lsp.buf.references()
				end, { desc = "[G]o to [R]eferences", buffer = bufnr })
				vim.keymap.set({ "n", "v" }, "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, { desc = "[C]ode [A]ction", buffer = bufnr })
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, { desc = "[S]ignature [H]elp", buffer = bufnr })

				vim.keymap.set("n", "<leader>ld", function()
					vim.diagnostic.open_float()
				end, { desc = "[L]ine [D]iagnostics", buffer = bufnr })
				vim.keymap.set("n", "<leader>ne", function()
					vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
				end, { desc = "[N]ext [E]rror", buffer = bufnr })
				vim.keymap.set("n", "<leader>nd", function()
					vim.diagnostic.goto_next()
				end, { desc = "[N]ext [D]iagnostic", buffer = bufnr })
				vim.keymap.set("n", "<leader>pe", function()
					vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end, { desc = "[P]revious [E]rror", buffer = bufnr })
				vim.keymap.set("n", "<leader>pd", function()
					vim.diagnostic.goto_prev()
				end, { desc = "[P]revious [D]iagnostic", buffer = bufnr })
			end,
		})

		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "copilot" },
			},
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-space>"] = cmp.mapping.complete(),
			}),
			snippet = {
				expand = function(args)
					-- You need Neovim v0.10 to use vim.snippet
					vim.snippet.expand(args.body)
				end,
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})

		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({})
			end,
		})
	end,
}

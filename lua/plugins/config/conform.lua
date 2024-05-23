return function(_, opts)
	local conform = require("conform")

	lvim.format_on_save.enabled = false

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "biome" } },
			typescript = { { "prettierd", "biome" } },
			typescriptreact = { { "prettierd", "biome" } },
			javascriptreact = { { "prettierd", "biome" } },
		},
		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_fallback = true,
			timeout_ms = 500,
		},
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
		end,
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

	vim.api.nvim_create_user_command("Format", function(args)
		local range = nil
		if args.count ~= -1 then
			local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
			range = {
				start = { args.line1, 0 },
				["end"] = { args.line2, end_line:len() },
			}
		end
		require("conform").format({ async = true, lsp_fallback = true, range = range })
	end, { range = true })

	-- rewrite which-key format binding
end

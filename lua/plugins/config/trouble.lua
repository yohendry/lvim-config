return function(_, opts)
	require("trouble").setup(opts)
	lvim.builtin.which_key.mappings["x"] = {
		name = "Trouble",
		x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
		X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
		s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
		Q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
		r = { "<cmd>Trouble lsp_references<cr>", "References" },
		f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
		q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
		l = { "<cmd>Trouble loclist<cr>", "LocationList" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
	}
end

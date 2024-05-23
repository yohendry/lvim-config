return function(_, opts)
	require("trouble").setup(opts)
	require("which-key").register({
		x = {
			name = "Trouble",
			x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
			X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
			s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
			l = {
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				"LSP Definitions / references / ... (Trouble)",
			},
			L = {
				"<cmd>Trouble loclist toggle<cr>",
				"Location List (Trouble)",
			},
			Q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
		},
	}, { prefix = "<leader>" })
end

return{
	"hedyhli/outline.nvim",

	lazy=true,

	cmd={"Outline","OutlineOpen"},

	keys={
		{"<leader>t","<cmd>Outline<CR>",desc="Toggle outline"},
	},

	opts={
		outline_window={
			position='right',
			width=10,
			auto_width={
				enabled=true,
				max_width=20,
				include_symbol_details=false,
			},

			relative_width=true
		},

		follow_cursor = false
	}
}

return {
	"preservim/vim-pencil",

	config = function()
		vim.g["pencil#conceallevel"] = 0
		vim.g["pencil#cursorwrap"] = 0 -- conflicts with my existing mappings

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "markdown",
			command = [[call pencil#init({'wrap': 'soft'})]],
		})
	end,
}

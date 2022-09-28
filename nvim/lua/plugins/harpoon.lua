return {
	"ThePrimeagen/harpoon",

	config = function()
		require("harpoon").setup({
			global_settings = {
				-- set marks specific to each git branch inside git repository
				mark_branch = true,
			},
		})
	end,
}

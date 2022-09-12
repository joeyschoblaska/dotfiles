return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			close_on_select = true,

			-- -- would love to override these but doesn't seem possible currently
			-- default_bindings = false,
			-- on_attach = function(bufnr)
			-- 	local mappings = {
			-- 		{ "k", ":AerialPrev<CR>" },
			-- 		{ "j", ":AerialNext<CR>" },
			-- 	}
			--
			-- 	for _, m in ipairs(mappings) do
			-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", m[1], m[2], { noremap = true, silent = true })
			-- 	end
			-- end,
		})
	end,
}

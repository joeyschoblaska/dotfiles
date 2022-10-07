local current_line_diagnostics = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr)

	if not next(diagnostics) then
		return ""
	end

	local hl_groups = {
		"DiagnosticError",
		"DiagnosticWarn",
		"DiagnosticInfo",
		"DiagnosticHint",
	}

	local signs = { " ", " ", " ", " " }
	local severity = diagnostics[1].severity
	local message = diagnostics[1].message

	return "%#" .. hl_groups[severity] .. "#" .. signs[severity] .. message
end

local refresh_events = {
	"WinEnter",
	"BufEnter",
	"SessionLoadPost",
	"FileChangedShellPost",
	"VimResized",
	"Filetype",
	"CursorMoved",
	"CursorMovedI",
}

if vim.fn.has("nvim-0.7") == 1 then -- utilize ModeChanged event introduced in 0.7
	table.insert(refresh_events, "ModeChanged")
end

local draw = function()
	local bufnr = vim.api.nvim_get_current_buf()

	if bufnr == nil or not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end

	vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, { "HELLO" })
end

-- vim.api.nvim_create_autocmd(refresh_events, {
-- 	pattern = "*",
-- 	callback = draw,
-- })

M = {}

M.toggle_diagnostic_virtual_text = function()
	local new_val = not vim.b.diagnosticVirtualText
	vim.b.diagnosticVirtualText = new_val
	vim.diagnostic.config({
		virtual_text = new_val,
	})
end

return M

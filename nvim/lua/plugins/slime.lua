vim.g.slime_target = "tmux"

-- send to the "next" window in the current socket
vim.cmd([[let g:slime_default_config = {"socket_name": (split($TMUX, ",") + ["default"])[0], "target_pane": ":.+"}]])

vim.g.slime_dont_ask_default = 1

return {
	"jpalardy/vim-slime",
}

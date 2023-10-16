-- Markdown preview server
return {
	'iamcco/markdown-preview.nvim',
	build = "cd app && npm install",
	ft = "markdown",
	lazy = true,
	config = function()
		local g = vim.g
		g.mkdp_auto_close = true
		g.mkdp_open_to_the_world = false
		g.mkdp_open_ip = "127.0.0.1"
		g.mkdp_port = "8889"
		g.mkdp_browser = "firefox"
		g.mkdp_echo_preview_url = true
		g.mkdp_page_title = "${name}"
		g.mkdp_highlight_css = '/home/gideon/.cache/wal/colors.css'
		g.mkdp_markdown_css = '/home/gideon/.config/nvim/static/markdown-preview/customStyle.css'
	end,
}

return {
 	"glepnir/dashboard-nvim",
 	config = function()
 		
		local db = require('dashboard')
		db.setup({
		    theme = 'hyper',
		    hide = {
			statusline,
			tabline,
			winbar,
		    },
		    config = {
			week_header = {
			    enable = false,
			},
			header = {
			    '⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⢀⣠⣾⣷⣿⣿⣿⣶⣤⣿⣠⣶⡶⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⢀⣤⡶⣿⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣂⡶⣶⡐⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⢀⣀⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣽⣿⣿⣿⣿⣿⣿⣇⣤⣄⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⣰⣶⣿⣏⢿⡿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⢿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⣰⣿⣯⠉⠉⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣾⣷⣾⣿⣿⣿⣿⣽⣿⡇⠀⠀⠉⠉⣹⣧⡀⠀⠀⠀',
			    '⠀⠀⢀⣍⣿⡁⢀⡀⠀⠀⣿⠏⠀⠀⠉⠁⠀⠙⣿⣧⡋⡀⠀⠀⠀⠀⢉⣿⡀⠀⢀⠀⢹⣧⣅⠀⠀⠀',
			    '⢠⡄⠘⠻⢿⣷⣶⣤⣴⣿⣿⡀⣀⢠⣀⠀⣀⣬⣡⣄⡬⣀⢀⡀⠀⠀⢀⣿⢿⣦⣼⣶⣿⡿⠞⠀⣀⠀',
			    '⢸⡇⠀⣠⣼⣿⡟⠉⠛⣿⣾⣿⣮⣯⣥⡶⢿⣯⢛⡟⣴⡿⢶⣥⣤⣶⣿⣵⣿⠛⠛⠿⢿⣤⡀⠂⣉⠀',
			    '⠀⠁⣼⢟⡿⠋⠀⠀⠀⣠⣤⠀⠀⠀⠙⠛⢢⣧⠊⠉⣜⡔⠛⠃⠀⠀⠠⣤⡀⠀⠀⠀⠻⣿⠹⡆⠃⠀',
			    '⠀⠀⠈⡜⣧⠠⠤⢀⡴⣻⠄⢀⠠⡀⢀⣠⣷⠋⠀⠀⠘⢶⣄⡀⡄⠀⠀⢠⡝⣄⠀⡤⢀⡼⠀⠀⠀⠀',
			    '⠀⠀⢀⣿⣿⣿⣿⣿⣷⣿⣷⣼⣠⣜⣿⣾⠁⠀⠀⠀⠀⠀⣿⣯⣓⣛⣁⣼⣿⣾⣿⣿⣿⣤⣧⠀⠀⠀',
			    '⠀⢀⠘⡿⣿⣿⢿⣾⣿⣿⣏⠙⠻⣿⣿⣯⣀⢀⣠⢄⡀⢂⣿⣿⡿⠋⠉⢙⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀',
			    '⠀⠀⠀⠀⠈⢁⠈⠙⠉⠉⠉⢹⡆⡾⢸⣿⣿⠿⣿⣿⣿⣯⣍⠀⣡⢰⡏⠉⠉⠛⠉⠀⠉⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠘⣄⠀⠀⠀⠀⡾⡰⣿⣿⢿⡿⣦⣿⣽⢿⢻⡟⢳⣽⣎⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠈⠀⣸⡆⠀⠀⠉⢠⣦⣾⣀⣾⡇⠑⠀⠀⣤⡀⠉⣾⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⠂⢸⣇⠀⠈⠲⠸⠏⣛⣫⣙⣃⣀⣀⣴⠋⣥⡔⠞⠁⠀⣿⠇⢪⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⢃⠘⠿⣴⠄⣤⡀⢃⠉⡝⣈⠛⠻⣉⢋⠀⣁⣰⢤⢰⣶⠟⠀⡏⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⠘⠆⠀⢹⣦⢠⡇⠙⣹⣧⡻⢼⠧⠟⣼⡿⠉⢹⢈⣼⡇⠀⠂⠁⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠳⣷⣷⣁⣺⣿⣿⣿⣤⣌⣻⣆⣾⡯⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
			    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠿⠿⠛⠛⠻⠿⠿⠟⠃⠀⠀⠀⠀          ',

			},
			-- TODO: add custom function
			footer =
			    function()
				return {
				    -- os.execute("misfortune", "-s")
				    'Add a custom function here'
				}
			    end,

			shortcut = {
			    {
				icon = ' ',
				desc = 'Update',
				group = '@punctuation',
				icon_hl = '@constant',
				action = 'Lazy update',
				key = 'u'
			    },
			    {
				icon = ' ',
				desc = 'Files',
				group = '@punctuation',
				icon_hl = '@include',
				action = 'Telescope find_files',
				key = 'f',
			    },
			    {
				icon = ' ',
				desc = 'Projects',
				group = '@punctuation',
				icon_hl = '@function',
				action = 'Telescope projects',
				key = 'p',
			    },
			},
		    },
		})
 	end,
}

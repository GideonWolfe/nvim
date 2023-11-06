-- Completion engine
return {
	'hrsh7th/nvim-cmp',
	config = function()

		-- Call cmp
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end


		-- Call luasnip
		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		-- Call LSPkind for symbols
		local lspkind = require('lspkind')

		-- TODO: is this necessary? What is this loading?
		require("luasnip/loaders/from_vscode").lazy_load()

		-- Helper function to assist completion
		local check_backspace = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end


		-- Main setup function for cmp
        --HACK: 
        --@diagnostic disable-next-line
		cmp.setup({
		    -- Declare Luasnip as snippet engine
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

		    -- Key mappings for completions
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				["<C-c>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Right>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.jumpable(1) then
						luasnip.jump(1)
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif check_backspace() then
						-- cmp.complete()
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),


		  formatting = {
		    -- LSPkind formatting
		    format = lspkind.cmp_format({
		      mode = 'symbol', -- show only symbol annotations
		      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

		      -- The function below will be called before any actual modifications from lspkind
		      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		      --before = function (entry, vim_item)
		      --  ...
		      --  return vim_item
		      --end

		    -- LSPkind symbols
		    symbol_map = {
		      Text = "󰉿",
		      LuaSnip = "✂️",
		      Method = "󰆧",
		      Function = "󰊕",
		      Constructor = "",
		      Field = "",
		      Variable = "󰀫",
		      Class = "󰠲",
		      Interface = "󱦜",
		      Module = "",
		      Property = "",
		      Unit = "",
		      Value = "󰎠",
		      Enum = "",
		      Keyword = "",
		      Snippet = "",
		      Color = "󰏘",
		      File = "",
		      Reference = "󰈇",
		      Folder = "",
		      EnumMember = "",
		      Constant = "󰏿",
		      Struct = "󱏒",
		      Event = "",
		      Operator = "",
		      TypeParameter = ""
		    },

		    })
		  },

		    -- TODO:
		    -- Formatting and icon customization
			-- formatting = {
			-- 	fields = { "kind", "abbr", "menu" },
			-- 	format = function(entry, vim_item)
			-- 		-- Kind icons
			-- 		vim_item.kind = kind_icons[vim_item.kind]

			-- 		if entry.source.name == "cmp_tabnine" then
			-- 			vim_item.kind = icons.misc.Robot
			-- 			vim_item.kind_hl_group = "CmpItemKindTabnine"
			-- 		end
			-- 		if entry.source.name == "copilot" then
			-- 			vim_item.kind = icons.git.Octoface
			-- 			vim_item.kind_hl_group = "CmpItemKindCopilot"
			-- 		end
		-- 
		-- 			if entry.source.name == "emoji" then
		-- 				vim_item.kind = icons.misc.Smiley
		-- 				vim_item.kind_hl_group = "CmpItemKindEmoji"
		-- 			end
		-- 
		-- 			if entry.source.name == "crates" then
		-- 				vim_item.kind = icons.misc.Package
		-- 				vim_item.kind_hl_group = "CmpItemKindCrate"
		-- 			end
		-- 
		-- 			-- NOTE: order matters
		-- 			vim_item.menu = ({
		-- 				nvim_lsp = "",
		-- 				nvim_lua = "",
		-- 				luasnip = "",
		-- 				buffer = "",
		-- 				path = "",
		-- 				emoji = "",
		-- 			})[entry.source.name]
		-- 			return vim_item
		-- 		end,
		-- 	},

		    -- Sources for completion to pull from
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "emoji" },
				{ name = "crates" },
				{ name = "dictionary" },
				{ name = "calc" },
			},

		    -- Confirmation behavior
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
		    -- Completion window settings
			window = {
				documentation = {
					border = "rounded",
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
				},
				completion = {
					border = "rounded",
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
				},
			},
			experimental = {
				ghost_text = true,
			},
		})
		end
}

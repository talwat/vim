local config = function()
	-- Register nvim-cmp lsp capabilities
	vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
	vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

	local cmp = require("cmp")
	local defaults = require("cmp.config.default")()
	local kind_icons = {
		Text = "",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰇽",
		Variable = "󰂡",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	}
	local window = cmp.config.window.bordered({
		border = { " ", " ", " ", " ", " ", " ", " ", " " },
		side_padding = 1,
	})
	local auto_select = true
	return {
		auto_brackets = {}, -- configure any filetype to auto add brackets
		completion = {
			completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
		},
		window = {
			completion = window,
			documentation = window,
		},
		formatting = {
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
				return vim_item
			end,
		},
		preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<Return>"] = cmp.mapping.confirm({ select = true }),
			["<C-CR>"] = function(fallback)
				cmp.abort()
				fallback()
			end,
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "path" },
		}, {
			{ name = "buffer" },
		}),
		sorting = defaults.sorting,
	}
end

return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	enabled = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	opts = config,
}

return {
		{
			"nvim-lua/plenary.nvim"
		},

		{
			"sindrets/diffview.nvim", 
		},

		{
			"craftzdog/solarized-osaka.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},

		{
			"hrsh7th/nvim-cmp"
		},

		{
			"NeogitOrg/neogit",
		},

		{
			"epwalsh/obsidian.nvim",
			opts = {
				workspaces = {
					{
						name = "personal",
						path = "~/vaults/personal",
					},
				},
			},
		},

		{
			"nvim-tree/nvim-tree.lua",
			config = function()
				require("nvim-tree").setup()
			end,
		},

		{
			"nvim-tree/nvim-web-devicons",
		},

		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
		},
}

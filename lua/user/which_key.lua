local which_key = require("which-key")

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local normal = {
	opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	mappings = {
		["a"] = { "<cmd>Alpha<cr>", "Alpha" },
		["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
		["x"] = { "<cmd>Bdelete<CR>", "Close Buffer" },
		["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		["S"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		["M"] = { "<cmd>message<cr>", "See Message" },

		u = {
			name = "Utool",
			a = { "<cmd>ArgWrap<cr>", "ArgWrap" },
			d = { "<cmd>DogeGenerate<cr>", "Doge Generate" },
			e = { "<Plug>(ExchangeClear)", "ExchangeClear" },
			l = { "<cmd>Linediff<cr>", "Line Diff" },
			u = { "<cmd>UndotreeToggle<cr>", "UndotreeToggle" },
			t = { "<cmd>TestNearest<cr>", "TestNearest" },
			T = { "<cmd>TestFile<cr>", "TestFile" },
		},

		m = {
			name = "Makrdown",
			p = { "<cmd>MarkdownPreview<cr>", "Preview" },
			s = { "<cmd>MarkdownPreviewStop<cr>", "Stop" },
			f = { "<cmd>Pangu<cr>", "Pangu" },
		},

		P = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		g = {
			name = "Git",
			b = { "<cmd>G blame<cr>", "Blame" },
			c = { "<cmd>Git commit<cr>", "Gcommit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
			r = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
			s = { "<cmd>tab Git<cr>", "Gstatus" },
			w = { "<cmd>Gwrite<cr>", "Open changed file" },
		},

		l = {
			name = "LSP",
			a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Action" },
			d = {
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Telescope diagnostics<cr>",
				"Workspace Diagnostics",
			},
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
		},

		s = {
			name = "Search",
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			f = { "<cmd>lua project_files()<CR>", "Find (Git) files" },
			F = { "<cmd>Telescope find_files<CR>", "Find files" },
			g = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles only_cwd=true<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
		},

		t = {
			name = "Terminal",
			n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
			p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
			f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
			h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
			v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		},
	},
}

local visual = {
	opts = {
		mode = "v",
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	},
	mappings = {
		u = {
			name = "Utool",
			l = { ":Linediff<cr>", "Line Diff" },
		},
	},
}

which_key.setup(setup)
for _, config in pairs({ normal, visual }) do
	which_key.register(config.mappings, config.opts)
end

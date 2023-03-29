--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
        -- Configure AstroNvim updates
        updater = {
                remote = "origin",     -- remote to use
                channel = "stable",    -- "stable" or "nightly"
                version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main",       -- branch name (NIGHTLY ONLY)
                commit = nil,          -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false,  -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false,   -- automatically reload and sync packer after a successful update
                auto_quit = false,     -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },
        -- Set colorscheme to use
        -- colorscheme = "default_theme",
        colorscheme = "sonokai",
        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },
        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true,         -- sets vim.opt.number
                        spell = false,         -- sets vim.opt.spell
                        signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
                        wrap = false,          -- sets vim.opt.wrap
                },
                g = {
                        mapleader = " ",                   -- sets vim.g.mapleader
                        autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true,                -- enable completion at start
                        autopairs_enabled = true,          -- enable autopairs at start
                        diagnostics_enabled = true,        -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = false,  -- disable notifications when toggling UI elements
                        heirline_bufferline = true,        -- enable new heirline based bufferline (requires :PackerSync after changing)
                        sonokai_style = "espresso",
                        python3_host_prog = '/home/silenus/.miniconda3/envs/nvim3/bin/python3',
                        vimtex_view_general_viewer = 'zathura',
                        vimtex_quickfix_open_on_warning = 0,
                        tex_flavor = 'lualatex'
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        -- local_vim.opt.whichwrap = vim.opt.whichwrap - { 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        -- return local_vim
        -- end,

        -- Set dashboard header
        header = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██         ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
        },
        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },
        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        "pyright",
                        "rust_analyzer",
                        "texlab",
                        "yamlls",
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true,     -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                        "rust",
                                        "lua",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        yamlls = {
                                   -- override table for require("lspconfig").yamlls.setup({...})
                                settings = {
                                        yaml = {
                                                schemas = {
                                                        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                                                        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                                                        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                                                },
                                        },
                                },
                        },
                },
        },
        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>sh"] = false,
                        ["<leader>sm"] = false,
                        ["<leader>sr"] = false,
                        ["<leader>sk"] = false,
                        ["<leader>sc"] = false,
                        ["<leader>sb"] = false,
                        ["<leader>sn"] = false,
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        ["<leader>lç"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
                        ["<leader>çb"] = { function() require("telescope.builtin").git_branches() end,
                                desc = "Git branches" },
                        ["<leader>çh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" },
                        ["<leader>çm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" },
                        ["<leader>çr"] = { function() require("telescope.builtin").registers() end,
                                desc = "Search registers" },
                        ["<leader>çk"] = { function() require("telescope.builtin").keymaps() end,
                                desc = "Search keymaps" },
                        ["<leader>çc"] = { function() require("telescope.builtin").commands() end,
                                desc = "Search commands" },
                        ["<esc>"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" },
                        ["<leader>sp"] = { "<cmd>setlocal spell spelllang=pt<cr>", desc = "Portuguese" },
                        ["<leader>se"] = { "<cmd>setlocal spell spelllang=en<cr>", desc = "English" },
                        ["<leader>sgp"] = { "<cmd>setlocal spell spelllang=pt,grc<cr>", desc = "Portuguese + Greek" },
                        ["<leader>sge"] = { "<cmd>setlocal spell spelllang=en,grc<cr>", desc = "English + Greek" },
                        ["<leader>sq"] = { "<cmd>setlocal nospell<cr>", desc = "Disable" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },
        -- Configure plugins
        plugins = {
                init = {
                        { "rust-lang/rust.vim" },
                        { "simrat39/rust-tools.nvim" },
                        -- { 'SirVer/ultisnips' },
                        -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
                        -- { 'fhill2/telescope-ultisnips.nvim' },
                        { "tpope/vim-surround" },
                        { "tpope/vim-repeat" },
                        { 'lervag/vimtex' },
                        { "sainnhe/sonokai" },
                        { "sainnhe/gruvbox-material" },
                        { "jamespeapen/Nvim-R" },
                        { "eigenfoo/stan-vim" },
                        { "hrsh7th/cmp-nvim-lsp-signature-help" },
                        { "hrsh7th/cmp-calc" },
                        { "hrsh7th/cmp-emoji" },
                        { "f3fora/cmp-spell" },
                        { "ray-x/cmp-treesitter" },
                        { "kdheepak/cmp-latex-symbols" },
                        { "jc-doyle/cmp-pandoc-references" },
                        { "onsails/lspkind-nvim" },
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = {
                                      -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                        ensure_installed = { "vim", "toml", "rust", "r", "python", "markdown", "help", "lua", "julia" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                        ensure_installed = {
                                "actionlint",
                                "bash-debug-adapter",
                                "bash-language-server",
                                "beautysh",
                                "black",
                                "cbfmt",
                                "flake8",
                                "html-lsp",
                                "json-lsp",
                                "jsonlint",
                                "lemminx",
                                "lua-language-server",
                                "markdownlint",
                                "marksman",
                                "mypy",
                                "prettier",
                                "prettierrrd",
                                "pylint",
                                "rust-analyzer",
                                "rustfmt",
                                "shellcheck",
                                "shellharden",
                                "shfmt",
                                "sumneko_lua",
                                "taplo",
                                "texlab",
                                "vim-language-server",
                                "vint",
                                "xmlformatter",
                                "yaml-language-server",
                                "yamlfmt",
                                "zk",
                        },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
        },
        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = "./lua/user/snippets",
                },
        },
        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },
        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                separators = {
                        tab = { "", "" },
                },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                icon_highlights = {
                        -- breadcrumbs = false, -- LSP symbols in the breadcrumbs
                        file_icon = {
                                winbar = true,     -- Filetype icon in the winbar inactive windows
                                statusline = true, -- Filetype icon in the statusline
                        },
                },
        },
        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                        ["ç"] = { name = "Save" },
                                        ["s"] = { name = "Spell" },
                                        ["sg"] = { name = "Spell - Greek" },
                                },
                        },
                },
        },
        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Ultisnips
                -- require('telescope').load_extension('ultisnips')
                -- vim.api.nvim_command("let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']")
                -- Rust type
                vim.api.nvim_create_augroup("rust", { clear = true })
                vim.api.nvim_create_autocmd("FileType", {
                        group = "rust",
                        command = "map <leader>rc :Cargo check<CR>",
                })
                vim.api.nvim_create_autocmd("FileType", {
                        group = "rust",
                        command = "map <leader>rb :Cargo build<CR>",
                })
                vim.api.nvim_create_autocmd("FileType", {
                        group = "rust",
                        command = "map <leader>rt :Cargo test<CR>",
                })
                vim.api.nvim_create_autocmd("FileType", {
                        group = "rust",
                        command = "map <leader>rr :Cargo run<CR>",
                })
                -- Latex
                vim.api.nvim_create_augroup("tex", { clear = true })
                vim.api.nvim_create_autocmd("FileType", {
                        group = "tex",
                        callback = function()
                                vim.opt.wrap = true
                                vim.opt.linebreak = true
                                vim.opt.breakindent = true
                        end
                })
                vim.api.nvim_command(
                "let g:vimtex_compiler_latexmk_engines = { 'xelatex': '-xelatex', '_': '-xelatex', 'pdflatex': '-pdf', 'dvipdfex': '-pdfdvi', 'lualatex': '-lualatex', 'context (pdftex)': '-pdf -pdflatex=texexec', 'context (luatex)': '-pdf -pdflatex=context', 'context (xetex)': '-pdf -pdflatex=''texexec --xtx''', } ")
                -- Spell
                vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                        pattern = { "*.tex", "*.md", "*.Rmd" },
                        command = "set spell spelllang=pt,en,grc,de",
                })
                -- Outros
                vim.api.nvim_command("set sidescrolloff=8")
                vim.api.nvim_command("set scrolloff=8")
                vim.api.nvim_command("let R_source = '~/.config/nvim/lua/user/tmux_split.vim'")

                -- Treesitter configuration
                require('nvim-treesitter.configs').setup {
                        -- If TS highlights are not enabled at all, or disabled via `disable` prop,
                        -- highlighting will fallback to default Vim syntax highlighting
                        highlight = {
                                enable = true,
                                -- Required for spellcheck, some LaTex highlights and
                                -- code block highlights that do not have ts grammar
                        },
                }
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config

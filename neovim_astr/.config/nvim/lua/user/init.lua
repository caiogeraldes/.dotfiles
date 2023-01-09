--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "nightly", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = true, -- automatically reload and sync packer after a successful update
        auto_quit = false, -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

    -- Set colorscheme to use
    -- colorscheme = "gruvbox-material",
    colorscheme = "sonokai",

    -- Add highlight groups in any theme
    highlights = {
    },

    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true, -- sets vim.opt.number
            spell = false, -- sets vim.opt.spell
            signcolumn = "auto", -- sets vim.opt.signcolumn to auto
            wrap = false, -- sets vim.opt.wrap
            list = true,
            linebreak = true,
        },
        g = {
            mapleader = "\\", -- sets vim.g.mapleader
            autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true, -- enable completion at start
            autopairs_enabled = true, -- enable autopairs at start
            diagnostics_enabled = true, -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
            ui_notifications_enabled = true, -- disable notifications when toggling UI elements
            sonokai_style = "espresso",
            python3_host_prog = '/home/silenus/.miniconda3/envs/nvim3/bin/python3',
            vimtex_view_general_viewer = 'zathura',
            vimtex_quickfix_open_on_warning = 0,
            tex_flavor = 'lualatex'
        },
    },

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

    default_theme = {
        highlights = function(hl) -- or a function that returns a new table of colors to set
            local C = require "default_theme.colors"

            hl.Normal = { fg = C.fg, bg = C.bg }

            hl.DiagnosticError.italic = true
            hl.DiagnosticHint.italic = true
            hl.DiagnosticInfo.italic = true
            hl.DiagnosticWarn.italic = true

            return hl
        end,
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

    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    lsp = {
        servers = {
            "pyright",
            "rust_analyzer",
            "texlab",
            "yamlls",
        },
        formatting = {
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000, -- default format timeout
        },
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            },
        },
        ["server-settings"] = {
            yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
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

    mappings = {
        n = {
            ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
            ["<leader>lç"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
            ["<esc>"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" },
            -- ["<leader>ut"] = { "<cmd>Telescope ultisnips<cr>", desc = "Ultisnips via Telescope" },
        },
        t = {
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
            -- Kill notification of indent-o-matic, temp fix
            ["Darazaki/indent-o-matic"] = { disable = true },
            { "caiogeraldes/indent-o-matic" },
        },
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            config.sources = {
            }
            return config -- return final config table
        end,
        treesitter = { -- overrides `require("treesitter").setup(...)`
            ensure_installed = { "c", "vim", "toml", "rust", "r", "python", "markdown", "help", "go", "lua" },
        },
        -- use mason-lspconfig to configure LSP installations
        ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
            ensure_installed = {
            },
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
            -- ensure_installed = { "prettier", "stylua" },
            ensure_installed = {
                "actionlint",
                "arduino-language-server",
                "autoflake",
                "awk-language-server",
                "bash-debug-adapter",
                "bash-language-server",
                "beautysh",
                "black",
                "cbfmt",
                "css-lsp",
                "deno",
                "emmet-ls",
                "eslint-lsp",
                "flake8",
                "gopls",
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
                "typescript-language-server",
                "vim-language-server",
                "vint",
                "xmlformatter",
                "yaml-language-server",
                "yamlfmt",
                "zk",
            },
        },
    },

    -- LuaSnip Options
    luasnip = {
        -- Extend filetypes
        -- filetype_extend = {
        -- javascript = { "javascriptreact" },
        -- },
        -- Configure luasnip loaders (vscode, lua, and/or snipmate)
        vscode = {
            -- Add paths for including more VS Code style snippets in luasnip
            paths = "./lua/user/snippets",
        },
    },

    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },

    ["which-key"] = {
        register = {
            n = {
                ["<leader>"] = {
                    ["b"] = { name = "Buffer" },
                    ["r"] = { name = "Rust" }
                },
            }
        },
    },

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
        vim.api.nvim_command("let g:vimtex_compiler_latexmk_engines = { 'xelatex': '-xelatex', '_': '-xelatex', 'pdflatex': '-pdf', 'dvipdfex': '-pdfdvi', 'lualatex': '-lualatex', 'context (pdftex)': '-pdf -pdflatex=texexec', 'context (luatex)': '-pdf -pdflatex=context', 'context (xetex)': '-pdf -pdflatex=''texexec --xtx''', } ")
        -- Spell
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = { "*.tex", "*.md", "*.Rmd" },
            command = "set spell spelllang=en_gb",

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
    end,
}

return config

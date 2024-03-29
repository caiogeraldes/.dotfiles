return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",         -- remote to use
    channel = "stable",        -- "stable" or "nightly"
    version = "latest",        -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",        -- branch name (NIGHTLY ONLY)
    commit = nil,              -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,         -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,      -- skip prompts about breaking changes
    show_changelog = true,     -- show the changelog after performing an update
    auto_quit = false,         -- automatically quit the current session after a successful update
    remotes = {                -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    }
  },
  -- Set colorscheme to use
  colorscheme = "gruvbox-material",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = { virtual_text = true, underline = true },
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = { "rust", "lua" },
        ignore_filetypes = {}
      },
      disabled = {},
      timeout_ms = 1000       -- default format timeout
    },
    servers = {},
    config = { texlab = { build = { onSave = true } } }
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml", "gzip", "matchit", "zipPlugin", "tarPlugin"
        }
      }
    }
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
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
    -- Spell
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*.tex", "*.md", "*.Rmd" },
      command = "set spell spelllang=pt,en,grc,de"
    })
    require("notify").setup { background_colour = "#000000" }

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
  end
}

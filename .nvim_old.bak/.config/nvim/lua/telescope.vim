lua << EOF
require('telescope').setup{
    defaults = {
      layout_strategy = "flex",
      file_ignore_patterns = {"node_modules/"},
      find_files = { theme = "dropdown" }
    },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('fzf')
EOF

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<esc>"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>s"] = { name = "Spelling" },
    ["<leader>sp"] = {
      "<cmd>setlocal spell spelllang=pt<cr>",
      desc = "Portuguese",
    },
    ["<leader>se"] = {
      "<cmd>setlocal spell spelllang=en<cr>",
      desc = "English",
    },
    ["<leader>sg"] = { name = "Ancient Greek + ?" },
    ["<leader>sgp"] = {
      "<cmd>setlocal spell spelllang=pt,grc<cr>",
      desc = "Portuguese + Greek",
    },
    ["<leader>sge"] = {
      "<cmd>setlocal spell spelllang=en,grc<cr>",
      desc = "English + Greek",
    },
    ["<leader>sq"] = { "<cmd>setlocal nospell<cr>", desc = "Disable" },
    -- ["<leader>l"] = {desc = " LaTeX"},
    -- ["<leader>ll"] = {"<cmd>TexlabBuild<cr>", desc = "LaTeX"},
    -- ["<leader>lf"] = {"<cmd>TexlabForward<cr>", desc = "Forward Search"},
    -- ["<leader>lb"] = {"<cmd>!biber main<cr>", desc = "Biber"},
    -- ["<leader>lz"] = {"<cmd>!zathura main.pdf&<cr><cr>", desc = "Zathura"},
    -- ["<leader>fB"] = {"<cmd>Telescope bibtex<cr>", desc = "Find BibTeX"},
    ["<leader>r"] = { desc = " Rust" },
    ["<leader>rb"] = { "<cmd>:!cargo build<cr>", desc = "Build" },
    ["<leader>rc"] = { "<cmd>:!cargo check<cr>", desc = "Check" },
    ["<leader>rC"] = { "<cmd>:!cargo clippy<cr>", desc = "Clippy" },
    ["<leader>rt"] = { "<cmd>:!cargo test<cr>", desc = "Test" },
    ["<leader>rr"] = { "<cmd>:!cargo run<cr>", desc = "Run" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

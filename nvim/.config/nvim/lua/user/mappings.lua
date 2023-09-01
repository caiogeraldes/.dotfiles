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
        ["<leader>bn"] = {"<cmd>tabnew<cr>", desc = "New tab"},
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr)
                        require("astronvim.utils.buffer").close(bufnr)
                    end)
            end,
            desc = "Pick to close"
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = {name = "Buffers"},
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<esc>"] = {"<cmd>nohlsearch<cr>", desc = "No Highlight"},
        ["<leader>sp"] = {
            "<cmd>setlocal spell spelllang=pt<cr>",
            desc = "Portuguese"
        },
        ["<leader>se"] = {
            "<cmd>setlocal spell spelllang=en<cr>",
            desc = "English"
        },
        ["<leader>sgp"] = {
            "<cmd>setlocal spell spelllang=pt,grc<cr>",
            desc = "Portuguese + Greek"
        },
        ["<leader>sge"] = {
            "<cmd>setlocal spell spelllang=en,grc<cr>",
            desc = "English + Greek"
        },
        ["<leader>sq"] = {"<cmd>setlocal nospell<cr>", desc = "Disable"},
        ["<leader>m"] = {desc = "󱁤 Compiler"},
        ["<leader>mt"] = {"<cmd>TexlabBuild<cr>", desc = "LaTeX"},
        ["<leader>mf"] = {"<cmd>TexlabForward<cr>", desc = "Forward Search"},

        ["<leader>fB"] = {"<cmd>Telescope bibtex<cr>", desc = "Find BibTeX"}
    },
    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    }
}

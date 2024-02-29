-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {

        ["<leader>e"] = {"<cmd>Neotree toggle<cr>", desc = "Toggle Explorer"},
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
        ["<leader>s"] = {name = " Spelling"},
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
        ["<leader>r"] = {desc = " Rust"},
        ["<leader>rb"] = {"<cmd>:!cargo build<cr>", desc = "Build"},
        ["<leader>rc"] = {"<cmd>:!cargo check<cr>", desc = "Check"},
        ["<leader>rC"] = {"<cmd>:!cargo clippy<cr>", desc = "Clippy"},
        ["<leader>rt"] = {"<cmd>:!cargo test<cr>", desc = "Test"},
        ["<leader>rr"] = {"<cmd>:!cargo run<cr>", desc = "Run"},
        ["<leader>O"] = {desc = " Orgmode"},
        ["<leader>R"] = {desc = "󰟔 R"}
    },
    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    }
}

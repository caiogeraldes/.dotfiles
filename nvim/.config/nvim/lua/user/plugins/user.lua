return {
    "rust-lang/rust.vim", "simrat39/rust-tools.nvim", "tpope/vim-repeat",
    "lervag/vimtex", "sainnhe/sonokai", {"sainnhe/gruvbox-material"},
    "eigenfoo/stan-vim", "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji", "f3fora/cmp-spell",
    "ray-x/cmp-treesitter", "kdheepak/cmp-latex-symbols",
    "jc-doyle/cmp-pandoc-references", "gpanders/nvim-parinfer",
    "onsails/lspkind-nvim", "eigenfoo/stan-vim", "elkowar/yuck.vim", {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end
    }
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
}

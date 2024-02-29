return {
    "jamespeapen/Nvim-R",
    lazy = false,
    config = function()
        vim.g.R_auto_start = 1
        vim.g.R_openhtml = 0
        vim.keymap.set("n", "<leader>Rl", '<cmd>call SendLineToR("stay")<cr>', { desc = "Send current line" })
        vim.keymap.set("n", "<leader>Rsj", '<cmd>call SendLineToR("down")<cr>', { desc = "Send line and jump" })
        vim.keymap.set("n", "<leader>Rsm", '<cmd>set opfunc=SendMotionToR")<cr>g@', { desc = "Send motion" })
        vim.keymap.set("n", "<leader>Rkp", '<cmd>call RMakeRmd("pdf_document")<cr>')
        vim.keymap.set("n", "<leader>Rkh", '<cmd>call RMakeRmd("html_document")<cr>')
    end,
}

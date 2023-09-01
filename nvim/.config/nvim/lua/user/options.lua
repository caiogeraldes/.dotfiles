-- set vim options here (vim.<first_key>.<second_key> = value)
return {
    opt = {
        -- set to true or false etc.
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false -- sets vim.opt.wrap
    },
    g = {
        mapleader = " ",
        autoformat_enabled = true,
        cmp_enabled = true,
        autopairs_enabled = true,
        diagnostics_mode = 2,
        icons_enabled = true,
        ui_notifications_enabled = true,
        python3_host_prog = "/home/silenus/.miniconda3/envs/nvim3/bin/python3",
        vimtex_view_general_viewer = "zathura",
        vimtex_quickfix_open_on_warning = 0,
        tex_flavor = "lualatex",
        gruvbox_material_background = "hard",
        gruvbox_material_transparent_background = 1,
        gruvbox_material_better_performance = 1
    }
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end

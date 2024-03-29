return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji",
        "jc-doyle/cmp-pandoc-references"
    },
    opts = function(_, opts)
        local cmp = require "cmp"
        local compare = require "cmp.config.compare"

        local function has_words_before()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
                       vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                           col, col):match "%s" == nil
        end

        return require("astronvim.utils").extend_tbl(opts, {
            window = {completion = {col_offset = -1, side_padding = 0}},
            sources = cmp.config.sources {
                {name = "nvim_lsp", priority = 1000},
                {name = "luasnip", priority = 750},
                {name = "pandoc_references", priority = 725},
                {name = "emoji", priority = 700},
                {name = "calc", priority = 650},
                {name = "path", priority = 500},
                {name = "buffer", priority = 250}
            },
            sorting = {
                comparators = {
                    compare.offset, compare.exact, compare.score,
                    compare.recently_used, function(entry1, entry2)
                        local _, entry1_under =
                            entry1.completion_item.label:find "^_+"
                        local _, entry2_under =
                            entry2.completion_item.label:find "^_+"
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end, compare.kind, compare.sort_text, compare.length,
                    compare.order
                }
            },
            mapping = {
                -- tab complete
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() and has_words_before() then
                        cmp.confirm {select = true}
                    else
                        fallback()
                    end
                end, {"i", "s"})
            }
        })
    end
}

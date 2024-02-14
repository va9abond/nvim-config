return {
    "phaazon/hop.nvim", cond = true, lazy = false,
    branch = "v2",

    opts = {
        keys = "wertuiopasdfghjklxcnm",
        case_insensitive = false,
    },

    keys = {
        { 'f', function()
            require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true})
         end },

        { 'F', function()
            require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true })
        end },

        { 't', function()
            require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end },

        { 'T', function()
            require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end },

        { "<leader>w", "<cmd>HopWord<cr>", mode = 'n' },
    },
}
-- ---------------------------------------------------------
                                           -- Fix hit colors
-- vim.cmd('hi HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
-- vim.cmd('hi HopNextKey1 guifg=#00dfff gui=bold ctermfg=45  cterm=bold')
-- vim.cmd('hi HopNextKey2 guifg=#2b8db3 ctermfg=33')
-- vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

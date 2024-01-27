-- ---------------------------------------------------------
                      -- https://github.com/phaazon/hop.nvim
-- ---------------------------------------------------------
return {
    "phaazon/hop.nvim",
    branch = "v2",

    config = function()
        local hop = require('hop')
        local directions = require('hop.hint').HintDirection

        hop.setup()

        vim.keymap.set('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true })

        vim.keymap.set('', 'F', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true })

        vim.keymap.set('', 't', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, { remap = true })

        vim.keymap.set('', 'T', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, { remap = true })

        vim.keymap.set('n', '<space>w', '<cmd>HopWord<cr>')
    end

}
-- ---------------------------------------------------------
                                           -- Fix hit colors
-- vim.cmd('hi HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
-- vim.cmd('hi HopNextKey1 guifg=#00dfff gui=bold ctermfg=45  cterm=bold')
-- vim.cmd('hi HopNextKey2 guifg=#2b8db3 ctermfg=33')
-- vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

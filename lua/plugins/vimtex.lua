return {
    "lervag/vimtex", cond = true, lazy = false,

    init = function()
        vim.opt.conceallevel = 0
        -- vim.g.tex_conceal = "abdmg"

        vim.g.vimtex_quickfix_enabled = 1
        vim.g.vimtex_quickfix_mode = 2
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g["vimtex_quickfix_ignore_filters"] = ({
            "Marginpar on page",
            "underfull",
            "overfull",
        })
        -- vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

        vim.g.vimtex_indent_enabled = 0
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_complete_enabled = 1

        vim.g["vimtex_log_ignore"] = ({
          "specifier changed to",
          "Token not allowed in a PDF string",
        })

        vim.g.vimtex_view_method = "sioyek"
        -- vim.g.vimtex_compiler_method = "latexmk" -- latexmk by default
        vim.g.vimtex_compiler_silent = 0 -- silent compiler msgs
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "aux",
            out_dir = "out",
            options = {
                -- '-aux-directory=aux',
                -- '-include-directory=~/.latex-template/inc',
                -- '-output-directory=out',
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
                '-shell-escape',
            }
        }
        vim.g.vimtex_compiler_clean_path = { "_minted*", }

        -- vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
        vim.g.vimtex_mappings_enabled = 0 -- disable `K` as it conflicts with LSP hover
        vim.g.vimtex_text_obj_enabled = 0
    end,

    keys = {
        { "<C-CR>", ft = "tex", "<cmd>VimtexCompile<cr>", desc = "Compile .tex document" },
    }
}

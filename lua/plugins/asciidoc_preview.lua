return {
    "tigion/nvim-asciidoc-preview", cond = true, lazy = true, ft = { "asciidoc" },
    build = 'cd server && npm install',
    config = true,
    keys = {
        {
            "<C-CR>",
            ft = "asciidoc",
            "<cmd>AsciiDocPreview<cr>",
            desc = "AsciiDoc Preview",
        },
    },
}

return {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function () end,
    opts = {
        inlay_hints = {
            inline = false,
        },
        ast = {
            role_icons = {
                    type = "🄣",
                    declaration = "🄓",
                    expression = "🄔",
                    statement = ";",
                    specifier = "🄢",
                    ["template argument"] = "🆃",
            },
            kind_icons = {
                    Compound = "🄲",
                    Recovery = "🅁",
                    TranslationUnit = "🅄",
                    PackExpansion = "🄿",
                    TemplateTypeParm = "🅃",
                    TemplateTemplateParm = "🅃",
                    TemplateParamObject = "🅃",
            },


            -- These require codicons (https://github.com/microsoft/vscode-codicons)
            -- role_icons = {
            --     type = "",
            --     declaration = "",
            --     expression = "",
            --     specifier = "",
            --     statement = "",
            --     ["template argument"] = "🆃",
            --     -- ["template argument"] = "",
            -- },

            -- kind_icons = {
            --     Compound = "",
            --     Recovery = "",
            --     TranslationUnit = "",
            --     PackExpansion = "",
            --     TemplateTypeParm = "🆃",
            --     TemplateTemplateParm = "🆃",
            --     TemplateParamObject = "🆃",
            -- },
        },
    },
}

local colors = {
    flavour = "dark",
    bg = "#2e3440",
    fg = "#E5E9F0",
    bg_alt = "#2b2e36",
    bg_float = "#3B4048",
    inactive = "#4C566A",
    subtle = "#4c566a",
    red = "#d94848",
    yellow = "#d4d198",
    orange = "#d08770",
    blue = "#5d8ac2",
    green = "#98C379",
    magenta = "#c487b9",
    highlight = "#434c5e",
    highlight_overlay = "#434c5e",
    highlight_inactive = "#3e4452",
    comment = "#699856",
    light_blue = "#8fc6e3",
    cyan = "#4EC9B0",
    vertsplit = "#373e4a",
    integer = "#B4CDA8",
    string = "#A3BE8C",
    line_number = "#4C566A",
    line_color = "#3B4252",
    visual_grey = "#3E4452",
    interface_color = "#84D9AA",
}
colors.groups = {
    styles = {
        keyword = { fg = colors.blue },
        comment = { fg = colors.comment },
        punc = { fg = colors.blue },
        variable = { fg = colors.light_blue },
        parameter = { fg = colors.light_blue },
        func = { fg = colors.yellow },
        string = { fg = colors.string },
    },
    diagnostics = { colors = { hint = colors.blue } },
}
colors.remaps = {
    base = {
        Normal = { fg = colors.fg, bg = colors.bg },
        ColorColumn = { fg = colors.red },
        CursorLine = { bg = colors.line_color },
        Directory = { fg = colors.blue },
        EndOfBuffer = { fg = colors.bg },
        ErrorMsg = { fg = colors.fg, bg = colors.red },
        VertSplit = { fg = colors.vertsplit },
        Folded = { fg = colors.comment },
        IncSearch = { fg = colors.yellow, bg = colors.comment },
        MatchParen = { fg = colors.fg, bg = colors.blue },
        NonText = { fg = colors.blue },
        Pmenu = { fg = colors.line_color },
        PmenuSbar = { fg = colors.visual_grey },
        PmenuSel = { bg = colors.visual_grey },
        PmenuThumb = { fg = colors.fg },
        Search = { bg = colors.blue },
        TabLine = { fg = colors.comment },
        TabLineSel = { fg = colors.fg },
        TabLineFill = { bg = colors.bg },
        Visual = { bg = colors.visual_grey },
        WarningMsg = { fg = colors.yellow },
        Whitespace = { fg = colors.fg },
        FloatBorder = { fg = colors.fg },
        Constant = { fg = colors.blue },
        Character = { link = "String" },
        Number = { fg = colors.integer },
        Boolean = { link = "Constant" },
        Float = { link = "Number" },

        Identifier = { fg = colors.light_blue },
        Function = { fg = colors.yellow },

        Statement = { fg = colors.blue },

        PreProc = { link = "Statement" },

        Type = { fg = colors.blue },

        Special = { fg = colors.blue },

        Error = { fg = colors.red },
    },
    plugins = {
        treesitter = {
            TSBoolean = { link = "Boolean" },
            TSCharacter = { link = "Character" },
            TSConstant = { link = "Constant" },
            TSError = { link = "Error" },
            TSField = { fg = colors.light_blue },
            TSFunction = { link = "Function" },
            TSFuncBuiltin = { link = "Function" },
            TSFuncMacro = { link = "Function" },
            TSNamespace = { fg = colors.cyan },
            TSType = { fg = colors.cyan },
            TSTypeBuiltin = { fg = colors.blue },
            TSVariable = { link = "TSField" },
            TSProperty = { link = "TSField" },
            TSKeyword = { fg = colors.blue },
            TSPunctBracket = { fg = colors.blue },
            TSConstructor = { fg = colors.blue },
            TSMethod = { link = "Function" },
            TSKeywordFunction = { link = "Keyword" },
            TSConditional = { link = "Keyword" },
            TSConstBuiltin = { link = "Keyword" },
            TSInclude = { link = "Keyword" },
            TSVariableBuiltin = { link = "Keyword" },
            TSTag = { link = "Keyword" },
            TSTitle = { link = "String" },
            TSLabel = { link = "String" },
        },

        gitsigns = {
            GitSignsChange = { fg = colors.yellow, bg = colors.bg },
        },

        cmp = {
            CmpItemKind = { fg = colors.blue },
        },

        trouble = {
            TroubleSignError = { fg = colors.red },
            TroubleSignWarning = { fg = colors.yellow },
        },

        nvim_tree = {
            NvimTreeRootFolder = { fg = colors.light_blue },
            NvimTreeFileDeleted = { fg = colors.red },
            NvimTreeGitDeleted = { fg = colors.red },
            NvimTreeGitDirty = { fg = colors.yellow },
        },

        telescope = {
            TelescopeSelection = { bg = colors.highlight_overlay },
            TelescopeMatching = { fg = colors.blue },
        },
    },
    langs = { md = { markdownCode = { fg = colors.string } } },
}

return colors

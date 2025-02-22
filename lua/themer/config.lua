local options = {
    colorscheme = "rose_pine", -- default colorscheme
    transparent = false,
    term_colors = true,
    dim_inactive = false,
    styles = {
        heading = {
            h1 = {},
            h2 = {},
        },
        ["function"] = {},
        functionBuiltIn = {},
        variable = {},
        variableBuiltIn = {},
        include = {},
        identifier = {},
        keyword = {},
        keywordBuiltIn = {},
        struct = {},
        string = {},
        parameter = {},
        field = {},
        type = {},
        typeBuiltIn = {},
        property = {},
        comment = {},
        punctuation = {},
        constructor = {},
        operator = {},
        constant = {},
        constantBuiltIn = {},
        todo = {},
        character = {},
        conditional = {},
        number = {},
        statement = {},
        uri = {},
        diagnostic = {
            underline = {
                error = {},
                warn = {},
                info = {},
                hint = {},
            },
            virtual_text = {
                error = {},
                warn = {},
                info = {},
                hint = {},
            },
        },
    },
    remaps = {
        palette = {},
        -- per colorscheme palette remaps, for example:
        -- remaps.palette = {
        --     rose_pine = {
        --     	fg = "#000000"
        --     }
        -- },
        -- would recommend to look into vim.api.nvim_set_hl() docs before using this
        -- remaps.highlights = {
        --     rose_pine = {
        --     	Normal = { bg = "#000000" }
        --     }
        -- },
        --
        -- Also you can do remaps.highlights.globals  for global highlight remaps
        highlights = {},
    },

    langs = {
        html = true,
        md = true,
    },

    plugins = {
        treesitter = true,
        indentline = true,
        barbar = true,
        bufferline = true,
        cmp = true,
        gitsigns = true,
        lsp = true,
        telescope = true,
    },
}

--- internal: iterate given options over the default config (for internal purposes)
--- user: iterate given options over the default config and loads the colorscheme
--- get: returns the options
--- @param type string
--- @param opts table
return function(type, opts)
    if type == "get" then
        return options
    elseif type == "internal" then
        options = vim.tbl_deep_extend("force", options, opts or {})
    elseif type == "user" then
        options = vim.tbl_deep_extend("force", options, opts or {})
        require("themer.modules.core")(options.colorscheme)
    end
end

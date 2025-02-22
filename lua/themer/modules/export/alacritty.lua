---@class alacritty
local alacritty = {}

---Returns hex color of the value of the hig group
---@param hl_name string hig group name
---@param value string foreground/background
---@return string hex value
local color_from_hl = function(hl_name, value)
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    local color = string.format("0x%x", hl[value] or 0)
    return color
end

---@return string term color
local get_term_color = function(number)
    local col = vim.g["terminal_color_" .. number]
    return col:gsub("#", "0x")
end

--- Returns config
---@return table config
alacritty.generate_alacritty_config = function()
    local config = { "# Put this in your alacritty.yml", "# Generated by Themer" }
    table.insert(config, "colors:")
    -- Primary
    table.insert(config, "\tprimary:")
    table.insert(config, "\t\tbackground: " .. color_from_hl("Normal", "background"))
    table.insert(config, "\t\tforeground: " .. color_from_hl("Normal", "foreground"))
    -- Cursor
    table.insert(config, "\tcursor:")
    table.insert(config, "\t\tbackground: " .. color_from_hl("Normal", "foreground"))
    table.insert(config, "\t\tforeground: " .. color_from_hl("Normal", "background"))
    -- Normal
    table.insert(config, "\tnormal:")
    table.insert(config, "\t\tblack: " .. get_term_color(0))
    table.insert(config, "\t\tred: " .. get_term_color(1))
    table.insert(config, "\t\tgreen: " .. get_term_color(2))
    table.insert(config, "\t\tyellow: " .. get_term_color(3))
    table.insert(config, "\t\tblue: " .. get_term_color(4))
    table.insert(config, "\t\tmagenta: " .. get_term_color(5))
    table.insert(config, "\t\tcyan: " .. get_term_color(6))
    table.insert(config, "\t\twhite: " .. get_term_color(7))
    -- Bright Colors
    table.insert(config, "\tbright:")
    table.insert(config, "\t\tblack: " .. get_term_color(8))
    table.insert(config, "\t\tred: " .. get_term_color(9))
    table.insert(config, "\t\tgreen: " .. get_term_color(10))
    table.insert(config, "\t\tyellow: " .. get_term_color(11))
    table.insert(config, "\t\tblue: " .. get_term_color(12))
    table.insert(config, "\t\tmagenta: " .. get_term_color(13))
    table.insert(config, "\t\tcyan: " .. get_term_color(14))
    table.insert(config, "\t\twhite: " .. get_term_color(15))
    return config
end

---Writes config to a buffer
---@return nil
alacritty.write_config = function()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "alacritty")
    vim.api.nvim_buf_set_lines(buf, 0, 1, true, alacritty.generate_alacritty_config())
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "readonly", true)
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "filetype", "yaml")
    vim.api.nvim_exec("buffer " .. buf, false)
end

return alacritty

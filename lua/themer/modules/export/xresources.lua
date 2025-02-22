---@class xres
local xres = {}

---@param hl_name string hig group name
---@param value string foreground/background
---@return string hex value
local color_from_hl = function(hl_name, value)
    local hl = vim.api.nvim_get_hl_by_name(hl_name, true)
    local color = string.format("#%x", hl[value] or 0)
    return color
end

---@return table config
xres.scrape_current_scheme = function()
    local c = {}
    c["*.background"] = color_from_hl("Normal", "background")
    c["*.foreground"] = color_from_hl("Normal", "foreground")
    for i = 0, 15 do
        c["*.color" .. i] = vim.g["terminal_color_" .. i]
    end
    return c
end

---Last step before writing to buffer
---@return table config
xres.generate_xres_config = function()
    local config = { "# Put the following lines in your .Xresources", "# Generated by Themer" }
    for setting_name, setting_value in pairs(xres.scrape_current_scheme()) do
        table.insert(config, setting_name .. ": " .. string.upper(setting_value))
    end
    return config
end

---Writes config to a buffer
xres.write_config = function()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "xres")
    vim.api.nvim_buf_set_lines(buf, 0, 1, true, xres.generate_xres_config())
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "readonly", true)
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(buf, "filetype", "xdefaults")
    vim.api.nvim_exec("buffer " .. buf, false)
end

return xres

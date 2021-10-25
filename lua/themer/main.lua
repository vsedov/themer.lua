--- @class main
local main = {}

-- useful aliases
local utils = require("themer.utils.util")
local config = require("themer.config").options

--- @param cs string colorscheme name
function main.load_colorscheme(cs)
	vim.g.colors_name = cs or config.colorscheme

	-- colorscheme gets evaluated from mapper.lua
	local return_value, color_scheme = require("themer.api.colors").get_color_scheme(cs or config.colorscheme)

	if not return_value.status then
		vim.api.nvim_err_writeln(return_value.msg)
	end

	local theme = require("themer.core.mapper").apply(return_value.color_scheme)
	
	-- Support for galaxyline
	if config.galaxyline then
		require("themer.galaxyline").get(cs, theme)
	end

	utils.load(theme)
end

return main
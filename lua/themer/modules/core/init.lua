--- loads the colorscheme
--- @param cs string colorscheme name
return function(cs)
    local color_palette = require("themer.modules.core.api").get_cp(cs)
    require("themer.modules.core.utils")(require("themer.modules.core.mapper")(color_palette, cs), cs)
end

local Entity = require('__stdlib__/stdlib/data/entity')
local Item = require('__stdlib__/stdlib/data/item')
local Recipe = require('__stdlib__/stdlib/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

--local icon_path = '__PickerCheats__/graphics/icons/'
--local entity_path = '__PickerCheats__/graphics/entities/'

Entity('heat-interface', 'heat-interface'):copy('picker-heat-interface')
local heat_interface = Item('heat-interface', 'item'):copy('picker-heat-interface'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'z')
if recipes then
    heat_interface:remove_flag('hidden')
    Recipe {
        type = 'recipe',
        name = 'picker-heat-interface',
        ingredients = {},
        result = 'picker-heat-interface',
        enabled = true,
        hidden = false
    }
end

Entity('infinity-pipe', 'infinity-pipe'):copy('picker-infinity-pipe'):set_field('gui_mode', 'admins')
local pipe_item = Item('infinity-pipe', 'item'):copy('picker-infinity-pipe'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'x')
if settings.startup['picker-cheat-recipes'].value then
    pipe_item:remove_flag('hidden')
    Recipe {
        type = 'recipe',
        name = 'picker-infinity-pipe',
        ingredients = {},
        result = 'picker-infinity-pipe',
        enabled = true,
        hidden = false
    }
end
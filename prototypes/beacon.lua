local Entity = require('__stdlib__/stdlib/data/entity')
local Item = require('__stdlib__/stdlib/data/item')
local Recipe = require('__stdlib__/stdlib/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

local name = 'picker-cheats-beacon'
local icon_path = '__PickerCheats__/graphics/icons/super-beacon.png'
local entity_path = '__PickerCheats__/graphics/entities/'

local beacon = Entity('beacon', 'beacon'):copy(name)
beacon.icon = icon_path
beacon.icon_size = 32
beacon.allowed_effects = {'consumption', 'speed', 'pollution', 'productivity'}
beacon.minable.mining_time = 0.5
beacon.supply_area_distance = 64
beacon.energy_source = {type = 'void'}
beacon.energy_usage = '1J'
beacon.distribution_effectivity = 0.5
beacon.module_specification = {
    module_slots = 7,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3
}
beacon.base_picture = {
    filename = entity_path .. 'super-beacon-base.png',
    width = 116,
    height = 93,
    shift = {0.34375, 0.046875}
}
beacon.animation = {
    filename = entity_path .. 'super-beacon-antenna.png',
    width = 54,
    height = 50,
    line_length = 8,
    frame_count = 32,
    shift = {-0.03125, -1.71875},
    animation_speed = 0.5
}
beacon.animation_shadow = {
    filename = entity_path .. 'super-beacon-antenna-shadow.png',
    width = 63,
    height = 49,
    line_length = 8,
    frame_count = 32,
    shift = {3.140625, 0.484375},
    animation_speed = 0.5
}


local item = Item('beacon', 'item'):copy(name)
item:set('icon', icon_path):set('icon_size', 32):subgroup_order('picker-cheats-research', 'b')
if recipes then
    item:Flags():remove('hidden')
    Recipe {
        name = name,
        type = 'recipe',
        enabled = true,
        hidden = false,
        ingredients = {},
        result = name
    }
else
    item:Flags():add('hidden')
end

local Entity = require('__stdlib__/stdlib/data/entity')
local Item = require('__stdlib__/stdlib/data/item')
local Recipe = require('__stdlib__/stdlib/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

local icon_path = '__PickerCheats__/graphics/icons/creative-lab.png'
local entity_path = '__PickerCheats__/graphics/entities/creative-lab.png'

local lab = Entity('lab', 'lab'):copy('picker-cheats-lab'):set('icon', icon_path):set('icon_size', 32)
lab.minable.mining_time = 0.5
lab.on_animation = {
    filename = entity_path,
    width = 113,
    height = 91,
    frame_count = 33,
    line_length = 11,
    animation_speed = 1 / 3,
    shift = {0.25, 0}
}
lab.off_animation = lab.on_animation
lab.module_specification.module_slots = 7
lab.energy_source = {type = 'void'}
lab.energy_usage = '1W'

local item = Item('lab', 'item'):copy('picker-cheats-lab')
item:set_field('icon', icon_path):set_field('icon_size', 32):subgroup_order('picker-cheats-research', 'a')
if recipes then
    item:Flags():remove('hidden')
    Recipe {
        name = 'picker-cheats-lab',
        type = 'recipe',
        enabled = true,
        hidden = false,
        ingredients = {},
        result = 'picker-cheats-lab'
    }
else
    item:Flags():add('hidden')
end

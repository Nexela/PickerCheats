local Entity = require('__stdlib__/data/entity')
local Item = require('__stdlib__/data/item')
local Recipe = require('__stdlib__/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

local icon_path = '__PickerCheats__/graphics/icons/'
local entity_path = '__PickerCheats__/graphics/entities/'

local function create_pole(from, name, gfx, order, distance, supply)
    local pole =
        Entity(from, 'electric-pole'):copy(name):set_fields {
        maximum_wire_distance = distance,
        supply_area_distance = supply,
        icon = icon_path .. gfx
    }
    pole.pictures.filename = entity_path .. gfx
    pole.minable.mining_time = 0.5

    local item = Item(from, 'item'):copy(name)
    item:set_field('icon', icon_path .. gfx):subgroup_order('picker-cheats-power', order)
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
end
create_pole('big-electric-pole', 'picker-cheats-electric-pole', 'super-electric-pole.png', 'a', 64, 2)
create_pole('substation', 'picker-cheats-substation', 'super-substation.png', 'b', 64, 64)

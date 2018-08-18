local Entity = require('__stdlib__/data/entity')
local Item = require('__stdlib__/data/item')
local Recipe = require('__stdlib__/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

local name = 'picker-cheats-radar'
local icon_path = '__PickerCheats__/graphics/icons/super-radar.png'
local entity_path = '__PickerCheats__/graphics/entities/'

local radar = Entity('radar', 'radar'):copy(name)
radar.icon = icon_path
radar.allowed_effects = {'consumption', 'speed', 'pollution', 'productivity'}
radar.minable.mining_time = 0.5
radar.energy_per_nearby_scan = '1J'
radar.energy_per_sector = '1J'
radar.supply_area_distance = 64
radar.energy_source = {type = 'void'}
--radar.energy_source = require('prototypes/cheats/energy-source')
radar.energy_usage = '1J'
radar.max_distance_of_nearby_sector_revealed = 32
radar.max_distance_of_sector_revealed = 32

radar.pictures =
		{
			filename = entity_path .. 'super-radar.png',
			priority = "low",
			width = 153,
			height = 131,
			apply_projection = false,
			direction_count = 64,
			line_length = 8,
			shift = {0.875, -0.34375}
		}

local item = Item('radar', 'item'):copy(name)
item:set_field('icon', icon_path):subgroup_order('picker-cheats-research', 'c')
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

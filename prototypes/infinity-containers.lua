local path = '__PickerCheats__/graphics/icons/'

local Entity = require('__stdlib__/stdlib/data/entity')
local Recipe = require('__stdlib__/stdlib/data/recipe')
local Item = require('__stdlib__/stdlib/data/item')

--------------------------------------------------------------------------------
--[Infinity-Chests]--
--------------------------------------------------------------------------------

local entity = Entity('infinity-chest', 'infinity-container'):copy('picker-infinity-chest')
entity:copy('picker-infinity-storage-chest'):set_fields {
        logistic_mode = 'storage',
        logistic_slots_count = 1,
        icon = path .. 'infinity-storage-chest.png'
    }.picture.filename = path .. 'infinity-storage-chest.png'
entity:copy('picker-infinity-requester-chest'):set_fields {
        logistic_mode = 'requester',
        icon = path .. 'infinity-requester-chest.png'
    }.picture.filename = path .. 'infinity-requester-chest.png'
entity:copy('picker-infinity-passive-chest'):set_fields {
        logistic_mode = 'passive-provider',
        icon = path .. 'infinity-passive-chest.png'
    }.picture.filename = path .. 'infinity-passive-chest.png'
entity:copy('picker-infinity-active-chest'):set_fields {
        logistic_mode = 'active-provider',
        icon = path .. 'infinity-active-chest.png'
    }.picture.filename = path .. 'infinity-active-chest.png'
entity:copy('picker-infinity-buffer-chest'):set_fields {
        logistic_mode = 'buffer',
        logistic_slots_count = 12,
        icon = path .. 'infinity-buffer-chest.png'
    }.picture.filename = path .. 'infinity-buffer-chest.png'

local item = Item('infinity-chest', 'item'):copy('picker-infinity-chest'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'a')
if settings.startup['picker-cheat-recipes'].value then
    item:remove_flag('hidden')
end
item:copy('picker-infinity-active-chest'):set_fields {icon = path .. 'infinity-active-chest.png'}:subgroup_order(nil, 'b')
item:copy('picker-infinity-passive-chest'):set_fields {icon = path .. 'infinity-passive-chest.png'}:subgroup_order(nil, 'c')
item:copy('picker-infinity-storage-chest'):set_fields {icon = path .. 'infinity-storage-chest.png'}:subgroup_order(nil, 'd')
item:copy('picker-infinity-buffer-chest'):set_fields {icon = path .. 'infinity-buffer-chest.png'}:subgroup_order(nil, 'e')
item:copy('picker-infinity-requester-chest'):set_fields {icon = path .. 'infinity-requester-chest.png'}:subgroup_order(nil, 'f')

if settings.startup['picker-cheat-recipes'].value then
    local chest =
        Recipe {
        type = 'recipe',
        name = 'picker-infinity-chest',
        ingredients = {},
        result = 'picker-infinity-chest',
        enabled = true,
        hidden = false
    }
    chest:copy('picker-infinity-active-chest'):set_fields {order = 'b'}
    chest:copy('picker-infinity-passive-chest'):set_fields {order = 'c'}
    chest:copy('picker-infinity-storage-chest'):set_fields {order = 'd'}
    chest:copy('picker-infinity-buffer-chest'):set_fields {order = 'e'}
    chest:copy('picker-infinity-requester-chest'):set_fields {order = 'f'}
end

Entity('infinity-pipe', 'infinity-pipe'):copy('picker-infinity-pipe')
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

Entity('heat-interface', 'heat-interface'):copy('picker-heat-interface')
local heat_interface = Item('heat-interface', 'item'):copy('picker-heat-interface'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'z')
if settings.startup['picker-cheat-recipes'].value then
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

Entity('electric-energy-interface', 'electric-energy-interface'):copy('picker-electric-energy-interface')
local heat_interface = Item('electric-energy-interface', 'item'):copy('picker-electric-energy-interface'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'z')
if settings.startup['picker-cheat-recipes'].value then
    heat_interface:remove_flag('hidden')
    Recipe {
        type = 'recipe',
        name = 'picker-electric-energy-interface',
        ingredients = {},
        result = 'picker-electric-energy-interface',
        enabled = true,
        hidden = false
    }
end

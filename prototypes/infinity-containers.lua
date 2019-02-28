local Entity = require('__stdlib__/stdlib/data/entity')
local Recipe = require('__stdlib__/stdlib/data/recipe')
local Item = require('__stdlib__/stdlib/data/item')

local ico_path = '__PickerCheats__/graphics/icons/infinity-chest/'
local ent_path = ico_path
--------------------------------------------------------------------------------
--[Infinity-Chests]--
--------------------------------------------------------------------------------
local entity = Entity('infinity-chest', 'infinity-container'):copy('picker-infinity-chest'):set_field('gui_mode', 'admins')
entity.picture = {
    filename = ent_path .. 'infinity-chest.png',
    width = 32,
    height = 32,
}
entity:copy('picker-infinity-storage-chest'):set_fields {
        logistic_mode = 'storage',
        logistic_slots_count = 1,
        icon = ico_path .. 'infinity-storage-chest.png'
    }.picture = {
        filename = ent_path .. 'infinity-storage-chest.png',
        width = 32,
        height = 32,
    }
entity:copy('picker-infinity-requester-chest'):set_fields {
        logistic_mode = 'requester',
        icon = ico_path .. 'infinity-requester-chest.png'
    }.picture = {
        filename = ent_path .. 'infinity-requester-chest.png',
        width = 32,
        height = 32,
    }
entity:copy('picker-infinity-passive-chest'):set_fields {
        logistic_mode = 'passive-provider',
        icon = ico_path .. 'infinity-passive-chest.png'
    }.picture = {
        filename = ent_path .. 'infinity-passive-chest.png',
        width = 32,
        height = 32,
    }
entity:copy('picker-infinity-active-chest'):set_fields {
        logistic_mode = 'active-provider',
        icon = ico_path .. 'infinity-active-chest.png'
    }.picture = {
        filename = ent_path .. 'infinity-active-chest.png',
        width = 32,
        height = 32,
    }
entity:copy('picker-infinity-buffer-chest'):set_fields {
        logistic_mode = 'buffer',
        logistic_slots_count = 12,
        icon = ico_path .. 'infinity-buffer-chest.png'
    }.picture = {
        filename = ent_path .. 'infinity-buffer-chest.png',
        width = 32,
        height = 32,
    }

local item = Item('infinity-chest', 'item'):copy('picker-infinity-chest'):set_fields {stack_size = 100}:subgroup_order('picker-cheats-containers', 'a')
if settings.startup['picker-cheat-recipes'].value then
    item:remove_flag('hidden')
end
item:copy('picker-infinity-active-chest'):set_fields {icon = ico_path .. 'infinity-active-chest.png'}:subgroup_order(nil, 'b')
item:copy('picker-infinity-passive-chest'):set_fields {icon = ico_path .. 'infinity-passive-chest.png'}:subgroup_order(nil, 'c')
item:copy('picker-infinity-storage-chest'):set_fields {icon = ico_path .. 'infinity-storage-chest.png'}:subgroup_order(nil, 'd')
item:copy('picker-infinity-buffer-chest'):set_fields {icon = ico_path .. 'infinity-buffer-chest.png'}:subgroup_order(nil, 'e')
item:copy('picker-infinity-requester-chest'):set_fields {icon = ico_path .. 'infinity-requester-chest.png'}:subgroup_order(nil, 'f')

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

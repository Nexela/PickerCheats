local Entity = require('__stdlib__/stdlib/data/entity')
local Recipe = require('__stdlib__/stdlib/data/recipe')
local Item = require('__stdlib__/stdlib/data/item')

local i_path = '__PickerCheats__/graphics/icons/'
local e_path = '__PickerCheats__/graphics/entities/'
local recipes = settings.startup['picker-cheat-recipes'].value
local name = 'picker-cheats-super-loader'

Entity('express-loader', 'loader'):copy(name):set_fields {
    gui_mode = 'admins',
    icon = i_path .. 'super-loader.png',
    icon_size = 32,
    speed = 1,
    structure = {
        direction_in = {
            sheet = {
                filename = e_path .. 'super-loader-structure.png',
                priority = 'extra-high',
                width = 64,
                height = 64
            }
        },
        direction_out = {
            sheet = {
                filename = e_path .. 'super-loader-structure.png',
                priority = 'extra-high',
                width = 64,
                height = 64,
                y = 64
            }
        }
    }
}:remove_field('next_upgrade')

local item = Item('loader', 'item'):copy(name)
item:set_fields {stack_size = 100, icon_size = 32, icon = i_path .. 'super-loader.png'}:subgroup_order('picker-cheats-containers', 'l'):add_flag('hidden')

if recipes then
    Recipe {
        type = 'recipe',
        name = name,
        ingredients = {},
        result = name,
        enabled = true,
        hidden = false
    }
    item:Flags():remove('hidden')
end

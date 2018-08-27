local Item = require('__stdlib__/stdlib/data/item')
local Recipe = require('__stdlib__/stdlib/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value
local icon_path = '__PickerCheats__/graphics/icons/'

local count = 0
local modules = {
    ['speed'] = {speed = {bonus = 2.5}},
    ['effectivity'] = {consumption = {bonus = -2.5}},
    ['productivity'] = {productivity = {bonus = 2.5}},
    ['clean'] = {pollution = {bonus = -2.5}},
    ['slow'] = {speed = {bonus = -2.5}},
    ['consumption'] = {consumption = {bonus = 2.5}},
    ['pollution'] = {pollution = {bonus = 2.5}}
}
local map = {
    ['speed'] = 'speed',
    ['effectivity'] = 'effectivity',
    ['productivity'] = 'productivity',
    ['clean'] = 'effectivity',
    ['slow'] = 'speed',
    ['consumption'] = 'effectivity',
    ['pollution'] = 'effectivity'
}

for name, effect in pairs(modules) do
    count = count + 1
    local item =
        Item {
        name = 'picker-cheats-module-' .. name,
        type = 'module',
        category = map[name],
        flags = {'goes-to-main-inventory'},
        icon = icon_path .. 'super-' .. name .. '-module.png',
        icon_size = 32,
        subgroup = 'picker-cheats-modules',
        order = 'modules-' .. count,
        tier = 50,
        stack_size = 50,
        effect = effect
    }
    if recipes then
        Recipe {
            name = 'picker-cheats-module-' .. name,
            type = 'recipe',
            enabled = true,
            hidden = false,
            ingredients = {},
            result = 'picker-cheats-module-' .. name
        }
    else
        item:Flags():add('hidden')
    end
end

local Entity = require('__stdlib__/stdlib/data/entity')
local Item = require('__stdlib__/stdlib/data/item')
local Recipe = require('__stdlib__/stdlib/data/recipe')

local recipes = settings.startup['picker-cheat-recipes'].value

local i_path = '__PickerCheats__/graphics/icons/'
--local e_path = '__PickerCheats__/graphics/entities/'

Entity('electric-energy-interface', 'electric-energy-interface'):copy('picker-electric-energy-interface'):set_field('gui_mode', 'admins')
local energy_interface_item = Item('electric-energy-interface', 'item'):copy('picker-electric-energy-interface')
energy_interface_item:set_fields {stack_size = 100}:subgroup_order('picker-cheats-power', 'z')
if recipes then
    energy_interface_item:remove_flag('hidden')
    Recipe {
        type = 'recipe',
        name = 'picker-electric-energy-interface',
        ingredients = {},
        result = 'picker-electric-energy-interface',
        enabled = true,
        hidden = false
    }
end

local images = {
    icon = {i_path .. 'energy-void.png', i_path .. 'passive-energy-void.png'},
}
for i, new_name in ipairs({'picker-cheats-energy-void-active', 'picker-cheats-energy-void-passive'}) do
    local name = 'picker-electric-energy-interface'
    local type = 'electric-energy-interface'
    Entity(name, type):copy(new_name):set_fields {
        icon = images.icon[i],
        energy_source = {
            type = 'electric',
            buffer_capacity = '500000GW',
            usage_priority = i == 1 and 'primary-input' or 'secondary-input',
            input_flow_limit = '500000GW'
            --output_flow_limit = '500GW'
        },
        --energy_production = '1w',
        energy_usage = '500000GW',
    }

    local item = Item(name, 'item'):copy(new_name):set_fields {icon = images.icon[i]}:subgroup_order('picker-cheats-power'):add_flag('hidden'):remove_field('icons')

    if recipes then
        item:Flags():remove('hidden')
        Recipe {
            name = new_name,
            type = 'recipe',
            enabled = true,
            hidden = false,
            ingredients = {},
            result = new_name
        }
    end
end

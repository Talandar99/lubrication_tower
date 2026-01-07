data:extend({
	{
		type = "item",
		name = "lubrication_tower",
		icon = "__base__/graphics/icons/beacon.png",
		subgroup = "production-machine",
		color_hint = { text = "2" },
		order = "the-beacon-of-lube",
		weight = 40 * kg,
		place_result = "lubrication_tower",
		stack_size = 50,
	},
})
data:extend({
	{
		name = "lubrication_tower",
		type = "beacon",
		icon = "__base__/graphics/icons/beacon.png",
		flags = { "placeable-player", "player-creation" },
		minable = { mining_time = 1, result = "lubrication_tower" },
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		allowed_effects = { "consumption", "speed", "pollution", "productivity" },
		graphics_set = require("beacon-animations"),
		energy_usage = "480kW",
		energy_source = {
			type = "fluid",
			fluid_usage_per_tick = 10,
			emissions_per_minute = { pollution = 5 },
			fluid_box = {
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = true,
				volume = 100,
				filter = "lubricant",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 } },
					{ direction = defines.direction.north, position = { 0, -1 } },
					{ direction = defines.direction.east, position = { 1, 0 } },
					{ direction = defines.direction.south, position = { 0, 1 } },
				},
				production_type = "input-output",
			},
		},
		radius_visualisation_picture = {
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			width = 10,
			height = 10,
		},
		supply_area_distance = 3,
		distribution_effectivity = 1.5,
		module_slots = 4,
	},
})

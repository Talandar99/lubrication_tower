local function lubrication_towerpipepictures()
	return {

		north = {
			filename = "__lubrication_tower__/graphics/assembling-machine-2-pipe-N.png",
			priority = "low",
			width = 71,
			height = 38,
			shift = util.by_pixel(2.25, 13.5),
			scale = 0.5,
		},
		east = {
			filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

data:extend({
	{
		type = "item",
		name = "lubrication-tower",
		icon = "__lubrication_tower__/graphics/lubrication_tower_icon.png",
		subgroup = "module",
		color_hint = { text = "2" },
		order = "ab[beacon]",
		weight = 40 * kg,
		place_result = "lubrication-tower",
		stack_size = 50,
	},
})
data.raw["fluid"]["lubricant"].fuel_value = "0.01MJ"
data:extend({
	{
		name = "lubrication-tower",
		type = "beacon",
		icon = "__lubrication_tower__/graphics/lubrication_tower_icon.png",
		flags = { "placeable-player", "player-creation" },
		minable = { mining_time = 1, result = "lubrication-tower" },
		collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		allowed_effects = { "consumption", "speed", "pollution" },
		graphics_set = require("beacon-animations"),
		max_health = 250,
		energy_usage = "50kW",
		energy_source = {
			type = "fluid",
			burns_fluid = true, -- fluid used as power
			emissions_per_minute = { pollution = 2 },
			light_flicker = {
				color = { 0, 0, 0, 0 }, -- to remove default burner glow
			},
			fluid_box = {
				pipe_picture = lubrication_towerpipepictures(),
				pipe_covers = pipecoverspictures(),
				always_draw_covers = true,
				volume = 10,
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
		module_slots = 3,
	},
})
data:extend({
	{
		type = "recipe",
		name = "lubrication-tower",
		enabled = false,
		ingredients = {
			{ type = "item", name = "steel-plate", amount = 50 },
			{ type = "item", name = "iron-plate", amount = 30 },
			{ type = "item", name = "pipe", amount = 20 },
			{ type = "item", name = "storage-tank", amount = 1 },
		},
		results = { { type = "item", name = "lubrication-tower", amount = 1 } },
	},
})

data:extend({
	{
		type = "technology",
		name = "lubrication-tower",
		icon_size = 200,
		icon = "__lubrication_tower__/graphics/lubrication_tower.png",
		essential = true,
		effects = {
			{ type = "unlock-recipe", recipe = "lubrication-tower" },
		},
		prerequisites = { "lubricant", "effect-transmission" },
		unit = {
			count = 200,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
			},
			time = 30,
		},
		order = "ea[pelagos]",
	},
})

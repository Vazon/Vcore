--vcore crafts--

minetest.register_craft({
	output = 'vcore:sword_talonite',
	recipe = {
		{'','vcore:talonite',''},
		{'','vcore:talonite',''},
		{'','default:stick',''},
	}
})

minetest.register_craft({
	output = 'vcore:shovel_talonite',
	recipe = {
		{'','vcore:talonite',''},
		{'','default:stick',''},
		{'','default:stick',''},
	}
})

minetest.register_craft({
	output = 'vcore:pick_talonite',
	recipe = {
		{'vcore:talonite','vcore:talonite','vcore:talonite'},
		{'','default:stick',''},
		{'','default:stick',''},
	}
})

minetest.register_craft({
	output = 'vcore:axe_talonite',
	recipe = {
		{'vcore:talonite','vcore:talonite',''},
		{'vcore:talonite','default:stick',''},
		{'','default:stick',''},
	}
})

minetest.register_craft({
	output = 'vcore:bow_talonite',
	recipe = {
		{'farming:string', 'vcore:talonite', ''},
		{'farming:string', '', 'vcore:talonite'},
		{'farming:string', 'vcore:talonite', ''},
	}
})

minetest.register_craft({
	output = 'vcore:talonite_block',
	recipe = {
		{'vcore:talonite','vcore:talonite','vcore:talonite'},
		{'vcore:talonite','vcore:talonite','vcore:talonite'},
		{'vcore:talonite','vcore:talonite','vcore:talonite'},
	}
})

minetest.register_craft({
	output = 'vcore:talonite 9',
	recipe = {
		{'','',''},
		{'','vcore:talonite_block',''},
		{'','',''},
	}
})

minetest.register_craft({
	output = 'vcore:talonite_chest',
	recipe = {
		{'default:steel_ingot','default:wood','default:steel_ingot'},
		{'default:wood','vcore:talonite','default:wood'},
		{'default:steel_ingot','default:wood','default:steel_ingot'},
	}
})

-- Fuel --

minetest.register_craft({
	type = "fuel",
	recipe = "vcore:talonite",
	burntime = 100,
})

minetest.register_craft({
	type = "fuel",
	recipe = "vcore:talonite_block",
	burntime = 900,
})


--load files--
dofile(minetest.get_modpath("vcore").."/mapgen.lua")
dofile(minetest.get_modpath("vcore").."/crafts.lua")
dofile(minetest.get_modpath("vcore").."/chest.lua")

--items--

minetest.register_craftitem("vcore:talonite", {
	description = "Talonite",
	inventory_image = "talonite.png",
})

--tools--

minetest.register_tool("vcore:space_ripper", {
	description = "Space Ripper",
	inventory_image = "space_riper.png",
	tool_capabilities = {
		full_punch_interval = 0,
		max_drop_level=3,
		groupcaps={
		unbreakable={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy = {times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			choppy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			bendy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			crumbly={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=4000},
	},
})
minetest.register_tool("vcore:sword_talonite", {
	description = "Talonite Sword",
	inventory_image = "talonite_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=.90, [2]=0.45, [3]=0.15}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	}
})
minetest.register_tool("vcore:pick_talonite", {
	description = "Talonite Pickaxe",
	inventory_image = "talonite_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=0.50, [3]=0.25}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})
minetest.register_tool("vcore:shovel_talonite", {
	description = "Talonite Shovel",
	inventory_image = "talonite_shovel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.55, [2]=0.25, [3]=0.15}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})
minetest.register_tool("vcore:axe_talonite", {
	description = "Talonite Axe",
	inventory_image = "talonite_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.05, [2]=0.45, [3]=0.25}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})

if (minetest.get_modpath("throwing"))
then
local throwing_shoot_arrow = function(itemstack, player)
	for _,arrow in ipairs(arrows) do
		if player:get_inventory():get_stack("main", player:get_wield_index()+1):get_name() == arrow[1] then
			if not minetest.setting_getbool("creative_mode") then
				player:get_inventory():remove_item("main", arrow[1])
			end
			local playerpos = player:getpos()
			local obj = minetest.env:add_entity({x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}, arrow[2])
			local dir = player:get_look_dir()
			obj:setvelocity({x=dir.x*19, y=dir.y*19, z=dir.z*19})
			obj:setacceleration({x=dir.x*-3, y=-10, z=dir.z*-3})
			obj:setyaw(player:get_look_yaw()+math.pi)
			minetest.sound_play("throwing_sound", {pos=playerpos})
			if obj:get_luaentity().player == "" then
				obj:get_luaentity().player = player
			end
			obj:get_luaentity().node = player:get_inventory():get_stack("main", 1):get_name()
			return true
		end
	end
	return false
end

minetest.register_tool("vcore:bow_talonite", {
	description = "Talonite Bow",
	inventory_image = "bow_talonite.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		if throwing_shoot_arrow(item, user, pointed_thing) then
			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(20000/200)
			end
		end
		return itemstack
	end,
})
end

--nodes--

minetest.register_node("vcore:talonite_block", {
	description = "Talonite Block",
	tiles = {"talonite_block.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("vcore:talonite_ore", {
	description = "Talonite Ore",
	tiles = {"default_stone.png^mineral_talonite.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'vcore:talonite',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:ladder", {
	description = "Ladder",
	drawtype = "nodebox",
		node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,0.375,-0.375,0.5,0.5}, --nodebox1
			{0.375,-0.5,0.375,0.5,0.5,0.5}, --nodebox2
			{-0.375,-0.4375,0.375,0.375,-0.3125,0.5}, --nodebox3
			{-0.375,-0.1875,0.375,0.375,-0.0625,0.5}, --nodebox4
			{-0.375,0.0625,0.375,0.375,0.1875,0.5}, --nodebox5
			{-0.375,0.3125,0.375,0.375,0.433174,0.5}, --nodebox7
		}
	},
	tiles = {"default_wood.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	paramtype2 = "facedir",
	paramtype3 = "wallmounted",
	walkable = true,
	climbable = true,
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.5,-0.5,0.375,0.5,0.5,0.5}
		}
	},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	legacy_wallmounted = true,
})
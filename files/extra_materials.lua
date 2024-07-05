local multiplier = ModSettingGet("lamas_fungal_shifts.extra_materials_probability")

local function CalcMultiplier(probability)
	local result = probability * multiplier
	if result > 1.0 or ModSettingGet("lamas_fungal_shifts.probability_bump") then 
		result = 1.0 
	end
	return result
end

local materials_from_extra = 
{
	{ probability = CalcMultiplier(0.50), materials = { "wood_static" } },
	{ probability = CalcMultiplier(0.01), materials = { "wood_tree" } },
	{ probability = CalcMultiplier(1.00), materials = { "magic_liquid_random_polymorph" } },
	{ probability = CalcMultiplier(0.20), materials = { "rock_static_radioactive" } },
	{ probability = CalcMultiplier(0.10), materials = { "rock_static_cursed" } },
	{ probability = CalcMultiplier(0.50), materials = { "fire", "flame", "fire_blue" } },
	{ probability = CalcMultiplier(0.70), materials = { "alcohol", "sima", "juhannussima" } },
	{ probability = CalcMultiplier(0.70), materials = { "material_confusion" } },
	{ probability = CalcMultiplier(0.50), materials = { "magic_liquid_movement_faster", "magic_liquid_faster_levitation", "magic_liquid_faster_levitation_and_movement" } },
	{ probability = CalcMultiplier(0.50), materials = { "magic_liquid_worm_attractor" } },
	{ probability = CalcMultiplier(0.20), materials = { "magic_liquid_protection_all" } },
	{ probability = CalcMultiplier(0.20), materials = { "magic_liquid_mana_regeneration" } },
	{ probability = CalcMultiplier(0.10), materials = { "magic_liquid_unstable_teleportation", "magic_liquid_teleportation" } },
	{ probability = CalcMultiplier(0.80), materials = { "swamp", "mud" } },
	{ probability = CalcMultiplier(0.20), materials = { "bone" } },
	{ probability = CalcMultiplier(0.20), materials = { "soil" } },
	{ probability = CalcMultiplier(0.50), materials = { "sandstone", "sandstone_surface" } },
	{ probability = CalcMultiplier(0.50), materials = { "slime", "slime_green", "slime_yellow", "slime_static" } },
	{ probability = CalcMultiplier(0.20), materials = { "pea_soup", "vomit" } },
	{ probability = CalcMultiplier(0.70), materials = { "ice" } },
	{ probability = CalcMultiplier(0.10), materials = { "wax", "honey" } },
	{ probability = CalcMultiplier(0.70), materials = { "coal" } },
	{ probability = CalcMultiplier(0.30), materials = { "gunpowder","gunpowder_explosive","gunpowder_tnt","gunpowder_unstable","gunpowder_unstable_big"} },
	{ probability = CalcMultiplier(0.30), materials = { "grass", "grass_dark", "grass_darker", "grass_dry", "grass_ice" } },
	{ probability = CalcMultiplier(0.20), materials = { "moss","moss_rust" } },
	{ probability = CalcMultiplier(0.10), materials = { "rock_static_glow" } },
	{ probability = CalcMultiplier(0.05), materials = {"rock_hard"} },
	{ probability = CalcMultiplier(0.01), materials = {"rock_hard_border"} },
	{ probability = CalcMultiplier(0.10), materials = {"steel_static"} },
}

local materials_to_extra = 
{
	{ probability = CalcMultiplier(0.60), material = "acid_gas" },
	{ probability = CalcMultiplier(0.40), material = "poison_gas" }, 
	{ probability = CalcMultiplier(0.40), material = "radioactive_gas" }, 
	{ probability = CalcMultiplier(0.40), material = "smoke" },
	{ probability = CalcMultiplier(0.60), material = "fire" },
	{ probability = CalcMultiplier(0.20), material = "fire_blue" },
	{ probability = CalcMultiplier(0.20), material = "juhannussima" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_faster_levitation_and_movement" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_worm_attractor" },
	{ probability = CalcMultiplier(0.05), material = "magic_liquid_protection_all" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_mana_regeneration" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_unstable_teleportation" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_unstable_polymorph" },
	{ probability = CalcMultiplier(0.30), material = "magic_liquid_berserk" },
	{ probability = CalcMultiplier(0.30), material = "magic_liquid_charm" },
	{ probability = CalcMultiplier(0.30), material = "magic_liquid_invisibility" },
	{ probability = CalcMultiplier(0.70), material = "swamp" },
	{ probability = CalcMultiplier(0.60), material = "mud" },
	{ probability = CalcMultiplier(0.30), material = "blood_cold" },
	{ probability = CalcMultiplier(0.10), material = "material_rainbow" },
	{ probability = CalcMultiplier(0.10), material = "aluminium_molten" },
	{ probability = CalcMultiplier(0.15), material = "cement" },
	{ probability = CalcMultiplier(0.10), material = "concrete_sand" },
	{ probability = CalcMultiplier(0.30), material = "sand_blue" },
	{ probability = CalcMultiplier(0.20), material = "bone" },
	{ probability = CalcMultiplier(0.40), material = "soil" },
	{ probability = CalcMultiplier(0.30), material = "sandstone" },
	{ probability = CalcMultiplier(0.20), material = "fungisoil" },
	{ probability = CalcMultiplier(0.10), material = "honey" },
	{ probability = CalcMultiplier(0.30), material = "glue" },
	{ probability = CalcMultiplier(0.30), material = "slime" },
	{ probability = CalcMultiplier(0.20), material = "slush" },
	{ probability = CalcMultiplier(0.10), material = "slime_green" },
	{ probability = CalcMultiplier(0.10), material = "slime_yellow" },
	{ probability = CalcMultiplier(0.05), material = "endslime" },
	{ probability = CalcMultiplier(0.10), material = "vine" },
	{ probability = CalcMultiplier(0.10), material = "root" },
	{ probability = CalcMultiplier(0.20), material = "snow" },
	{ probability = CalcMultiplier(0.10), material = "ice" },
	{ probability = CalcMultiplier(0.10), material = "sand_herb" },
	{ probability = CalcMultiplier(0.10), material = "wax" },
	{ probability = CalcMultiplier(0.10), material = "coal" },
	{ probability = CalcMultiplier(0.10), material = "sulphur" },
	{ probability = CalcMultiplier(0.10), material = "salt" },
	{ probability = CalcMultiplier(0.10), material = "sodium" },
	{ probability = CalcMultiplier(0.10), material = "purifying_powder" },
	{ probability = CalcMultiplier(0.10), material = "burning_powder" },
	{ probability = CalcMultiplier(0.10), material = "rat_powder" },
	{ probability = CalcMultiplier(0.10), material = "shock_powder" },
	{ probability = CalcMultiplier(0.05), material = "orb_powder" },
	{ probability = CalcMultiplier(0.05), material = "plastic_red" },
	{ probability = CalcMultiplier(0.30), material = "grass" },
	{ probability = CalcMultiplier(0.10), material = "grass_ice" },
	{ probability = CalcMultiplier(0.10), material = "grass_dry" },
	{ probability = CalcMultiplier(0.30), material = "fungi_green" },
	{ probability = CalcMultiplier(0.10), material = "grass_dark" },
	{ probability = CalcMultiplier(0.10), material = "fungi_creeping" },
	{ probability = CalcMultiplier(0.05), material = "fungi_creeping_secret" },
	{ probability = CalcMultiplier(0.30), material = "spore" },
	{ probability = CalcMultiplier(0.30), material = "moss" },
	{ probability = CalcMultiplier(0.10), material = "moss_rust" },
	{ probability = CalcMultiplier(0.30), material = "plant_material" },
	{ probability = CalcMultiplier(0.10), material = "plant_material_red" },
	{ probability = CalcMultiplier(0.10), material = "mushroom" },
	{ probability = CalcMultiplier(0.10), material = "mushroom_seed" },
	{ probability = CalcMultiplier(0.10), material = "glowshroom" },
	{ probability = CalcMultiplier(0.10), material = "bush_seed" },
	{ probability = CalcMultiplier(0.30), material = "plant_seed" },
	{ probability = CalcMultiplier(0.10), material = "rust_static" },
	{ probability = CalcMultiplier(0.30), material = "lavarock_static" },
	{ probability = CalcMultiplier(0.30), material = "rock_static_glow" },
	{ probability = CalcMultiplier(0.10), material = "templebrick_golden_static" },
	{ probability = CalcMultiplier(0.01), material = "creepy_liquid" },
	{ probability = CalcMultiplier(0.10), material = "glowstone" },
	{ probability = CalcMultiplier(0.10), material = "meat_static" },
	{ probability = CalcMultiplier(0.10), material = "steel_static" },
}

local materials_to_extra_extra = 
{
	{ probability = CalcMultiplier(0.10), material = "midas" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_hp_regeneration" },
	{ probability = CalcMultiplier(0.10), material = "magic_liquid_hp_regeneration_unstable" },
	{ probability = CalcMultiplier(0.20), material = "gold_molten" },
	{ probability = CalcMultiplier(0.10), material = "gold" },
	{ probability = CalcMultiplier(0.10), material = "gold_radioactive" },
}

local materials_to_extra_danger = 
{
	{ probability = CalcMultiplier(0.10), material = "void_liquid" },
	{ probability = CalcMultiplier(0.10), material = "creepy_liquid" },
	{ probability = CalcMultiplier(0.10), material = "monster_powder_test" },
	{ probability = CalcMultiplier(0.10), material = "fungus_powder" },
	{ probability = CalcMultiplier(0.10), material = "fungus_powder_bad" },
}

local materials_to_extra_danger_CC = 
{
	{ probability = CalcMultiplier(0.10), material = "cc_antimatter_powder" },
	{ probability = CalcMultiplier(0.10), material = "aa_unstable_pandorium" },
}

local function AppendToFile(file, new_content)
	local content = ModTextFileGetContent(file)
	local new = content .. "\n" .. new_content
	ModTextFileSetContent(file, new)
end

local function TableToAppendString(element, array)
	local string = "table.insert("
	if array then
		string = string .. "materials_from"
	else
		string = string .. "materials_to"
	end
	string = string .. ",{ probability = " .. element["probability"] 
	if array then
		string = string .. ", materials = { "
		for i,mat in ipairs(element.materials) do
			string = string .. "\"" .. mat .. "\","
		end
		string = string .. "} })\n"
	else
		string = string .. ", material = \"" .. element.material .. "\"})\n"
	end
	return string
end

local function AddMaterial(table, array)
	local new_content = ""
	for _,element in ipairs(table) do
		new_content = new_content .. TableToAppendString(element, array)
	end
	AppendToFile(fungal_file, new_content)
end

if ModSettingGet("lamas_fungal_shifts.extra_materials_from") then
	AddMaterial(materials_from_extra, true)
end

if ModSettingGet("lamas_fungal_shifts.extra_materials_to") then
	AddMaterial(materials_to_extra, false)
end

if ModSettingGet("lamas_fungal_shifts.extra_extra_materials_to") then
	AddMaterial(materials_to_extra_extra, false)
end

if ModSettingGet("lamas_fungal_shifts.extra_materials_to_danger") then
	AddMaterial(materials_to_extra_danger, false)
	if ModIsEnabled("Hydroxide") then AddMaterial(materials_to_extra_danger_CC, false) end
end
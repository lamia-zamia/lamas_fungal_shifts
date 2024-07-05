fungal_file = "data/scripts/magic/fungal_shift.lua"

local function ReplaceFunction(file, search, replace)
	local content = ModTextFileGetContent(file)
	local new = content:gsub(search, replace)
	ModTextFileSetContent(file, new)
end

local function ReplaceFlaskUsage()
	if ModSettingGet("lamas_fungal_shifts.guaranteed_fungal_shift") then
		local search_string = "if held_material > 0 and random_nexti%( rnd, 1, 100 %) <= 75 then"
		local replace_string = "if held_material > 0 then"
		ReplaceFunction(fungal_file, search_string, replace_string)
	end
end

local function ReplaceCooldown()
	local cooldown = ModSettingGet("lamas_fungal_shifts.fungal_shift_cooldown")
	if cooldown < 300 then
		local search_string = "if frame < last_frame %+ 60%*60%*5 and not debug_no_limits then"
		local replace_string = "if frame < last_frame + " .. cooldown * 60 .. " and not debug_no_limits then"
		ReplaceFunction(fungal_file, search_string, replace_string)
	end
end

local function ReplaceMaxShift()
	local max_shift = ModSettingGet("lamas_fungal_shifts.fungal_shift_max")
	if max_shift > 20 then
		local search_string = "(if iter >= )(20)( and not debug_no_limits then)"
		local replace_string = "%1" .. max_shift .. "%3"
		ReplaceFunction(fungal_file, search_string, replace_string)
	end
end

local function ReplaceTrip()
	if ModSettingGet("lamas_fungal_shifts.trip_shorten") then
		local tripfile = "data/scripts/status_effects/status_list.lua"
		local search_string = "(effect_entity=\"data/entities/misc/effect_trip_03%.xml.-min_threshold_normalized=)3%.0"
		local replace_string = "%10.0"
		ReplaceFunction(tripfile, search_string, replace_string)
	end
end

function OnModPreInit()
	ReplaceFlaskUsage()
	ReplaceCooldown()
	ReplaceMaxShift()
	ReplaceTrip()
	dofile_once("mods/lamas_fungal_shifts/files/extra_materials.lua")
	local content = ModTextFileGetContent(fungal_file)
	print(content)
end
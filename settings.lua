dofile("data/scripts/lib/mod_settings.lua") 

local function mod_setting_number_integer( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local value_new = GuiSlider( gui, im_id, mod_setting_group_x_offset, 0, setting.ui_name, value, setting.value_min, setting.value_max, setting.value_default, setting.value_display_multiplier or 1, setting.value_display_formatting or "", 64 )
	value_new = math.floor(value_new + 0.5)
	if value ~= value_new then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), value_new, false )
		mod_setting_handle_change_callback( mod_id, gui, in_main_menu, setting, value, value_new )
	end
	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

local mod_id = "lamas_fungal_shifts" 
mod_settings_version = 1 
mod_settings = 
{
	{
		id = "guaranteed_fungal_shift",
		ui_name = "Guaranteed flask usage",
		ui_description = "If enabled will always use flask in fungal shift",
		value_default = true,
		scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
	},
	{
		id = "fungal_shift_cooldown",
		ui_name = "Fungal shift cooldown",
		ui_description = "In seconds",
		value_default = 300,
		value_min = 0,
		value_max = 300,
		value_display_formatting = " $0 seconds",
		scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
		ui_fn = mod_setting_number_integer,
	},
	{
		id = "fungal_shift_max",
		ui_name = "Maximum fungal shifts",
		ui_description = "How many times the game will allow to shift",
		value_default = 20,
		value_min = 20,
		value_max = 100,
		scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
		ui_fn = mod_setting_number_integer,
	},
	{
		id = "trip_shorten",
		ui_name = "Decrease required tripping amount",
		ui_description = "If enabled tripping effect will be applied with 10 seconds of debuff",
		value_default = false,
		scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
	},
	{
		category_id = "extra_materials",
		ui_name = "Extra materials",
		ui_description = "Settings for extra materials",
		foldable = true,
		_folded = true,
		settings = 
		{
			{
				id = "extra_materials_from",
				ui_name = "Add extra materials into \"from\" table",
				ui_description = "Adds extra materials to fungal shift tables",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "extra_materials_to",
				ui_name = "Add extra materials into \"to\" table",
				ui_description = "Adds extra materials to fungal shift tables",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "extra_extra_materials_to",
				ui_name = "Add extra unbalanced materials into \"to\" table",
				ui_description = "Gold, Healthium, etc",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "extra_materials_to_danger",
				ui_name = "Add dangerous materials into \"to\" table",
				ui_description = "Void liquid, creepy liquid, etc (possibly game-breaking)",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "extra_materials_probability",
				ui_name = "Multiplier of extra materials probability",
				ui_description = "How often extra materials should be chosen",
				value_default = 1.0,
				value_min = 0.1,
				value_max = 2,
				value_display_multiplier = 100,
				value_display_formatting = " $0%",
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "probability_bump",
				ui_name = "Make new materials appear way more often",
				ui_description = "Force new materials to have a maximum probability of appearing\n(Kinda makes shifts messy)",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
		},
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) 
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end


function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end

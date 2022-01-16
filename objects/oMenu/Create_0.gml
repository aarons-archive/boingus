/// @description Create variables


////////////
// Enums //
//////////
enum pages {
	main,
	settings,
	audio, 
	difficulty,
	graphics,
}

enum element {
	run_script,
	change_page,
	slider,
	shift,
	toggle,
	input,
}


///////////////////
// Create menus //
/////////////////
ds_main_menu = create_menu([
	["RESUME",		element.run_script,		resume_game							],
	["SETTINGS",	element.change_page,	pages.settings						],
	["EXIT",		element.run_script,		exit_game							],
])
ds_settings_menu = create_menu([
	["AUDIO",		element.change_page,	pages.audio							],
	["DIFFICULTY",	element.change_page,	pages.difficulty					],
	["GRAPHICS",	element.change_page,	pages.graphics						],
	["BACK",		element.change_page,	pages.main							],
])
ds_audio_menu = create_menu([
	["MASTER",		element.slider,			change_volume,		0.5,		[0, 1]		],
	["SOUNDS",		element.slider,			change_volume,		0.2,		[0, 1]		],
	["MUSIC",		element.slider,			change_volume,		1,			[0, 1]		],
	["BACK",		element.change_page,	pages.settings,		undefined,  undefined	],
])
ds_difficulty_menu = create_menu([
	["ENEMIES",		element.shift,			change_difficulty,	0,			["HARMLESS", "NORMAL", "TERRIBLE"]		],
	["ALLIES",		element.shift,			change_difficulty,	0,			["DIM-WITTED", "NORMAL", "HELPFUL"]		],
	["BACK",		element.change_page,	pages.settings,		undefined,  undefined								],
])
ds_graphics_menu = create_menu([
	["RESOLUTION",	element.shift,			change_resolution,	0,			["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]	],
	["WINDOW MODE", element.toggle,			change_window_mode, 1,			["FULLSCREEN", "WINDOWED"]												],
	["BACK",		element.change_page,	pages.settings,     undefined,  undefined																],
])


///////////
// Vars //
/////////
global.paused = false
inputting = false

view_width = camera_get_view_width(view_camera[0])
view_height = camera_get_view_height(view_camera[0])

menus = [
	ds_main_menu,
	ds_settings_menu,
	ds_audio_menu,
	ds_difficulty_menu,
	ds_graphics_menu,
]
page = 0
for (var i = 0; i < array_length(menus); i++) {
	selected_elements[i] = 0
}


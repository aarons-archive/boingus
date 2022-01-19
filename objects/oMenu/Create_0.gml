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
	["RESTART",     element.run_script,     restart_game						],
	// ["SETTINGS",	element.change_page,	pages.settings						],
	["EXIT",		element.run_script,		exit_game							],

])
ds_settings_menu = create_menu([
	["SOUNDS",		element.slider,			undefined,			0.5,		[0, 1]						],
	["DIFFICULTY",	element.shift,			undefined,			0,			["EASY", "MEDIUM", "HARD"]	],
	["WINDOW MODE", element.toggle,			undefined,			1,			["FULLSCREEN", "WINDOWED"]	],
	["BACK",		element.change_page,	pages.main,			undefined,	undefined					],
])


///////////
// Vars //
/////////
global.paused = false
inputting = false

view_width = camera_get_view_width(view_camera[0])

menus = [
	ds_main_menu,
	ds_settings_menu,
]
page = 0
for (var i = 0; i < array_length(menus); i++) {
	selected_elements[i] = 0
}


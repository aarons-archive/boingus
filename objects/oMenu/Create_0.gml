/// @description Create variables


///////////////////
// Create menus //
/////////////////
ds_menu = create_menu([
	["RESUME",		element_type.RUN_SCRIPT,	resume_game					],
	["RESTART",     element_type.RUN_SCRIPT,    restart_level				],
	["EXIT",		element_type.RUN_SCRIPT,    exit_level,					],
	["SETTINGS",	element_type.CHANGE_PAGE,	pages.MENU_SETTINGS			],
	["QUIT",		element_type.RUN_SCRIPT,	quit_game					],

])
ds_menu_settings = create_menu([
	["DIFFICULTY",	element_type.SHIFT,			undefined,			0,			["EASY", "MEDIUM", "HARD"]	],
	["BACK",		element_type.CHANGE_PAGE,	pages.MENU,			undefined,	undefined					],
])

global.paused = false
inputting = false

view_width = camera_get_view_width(view_camera[0])

menus = [
	ds_menu,
	ds_menu_settings,
]
page = 0
for (var i = 0; i < array_length(menus); i++) {
	selected_elements[i] = 0
}


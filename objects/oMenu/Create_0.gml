/// @description Menu drawing

global.paused = false;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);
display_set_gui_size(global.view_width, global.view_height);


enum pages {
	main,
	settings,
	audio, 
	difficulty,
	graphics,
}

enum option {
	run_script,
	change_page,
	slider,
	shift,
	toggle,
	input,
}

ds_menu_main = create_menu([
	["RESUME",		option.run_script,	resume_game							],
	["SETTINGS",	option.change_page,	pages.settings						],
	["EXIT",		option.run_script,	exit_game							],
])

ds_menu_settings = create_menu([
	["AUDIO",		option.change_page,	pages.audio							],
	["DIFFICULTY",	option.change_page,	pages.difficulty					],
	["GRAPHICS",	option.change_page,	pages.graphics						],
	["BACK",		option.change_page,	pages.main							],
]);

ds_menu_audio = create_menu([
	["MASTER",		option.slider,		change_volume,		0.5,		[0, 1]		],
	["SOUNDS",		option.slider,		change_volume,		0.2,		[0, 1]		],
	["MUSIC",		option.slider,		change_volume,		1,			[0, 1]		],
	["BACK",		option.change_page,	pages.settings,		undefined,  undefined	],
]);

ds_menu_difficulty = create_menu([
	["ENEMIES",		option.shift,		change_difficulty,	0,			["HARMLESS", "NORMAL", "TERRIBLE"]		],
	["ALLIES",		option.shift,		change_difficulty,	0,			["DIM-WITTED", "NORMAL", "HELPFUL"]		],
	["BACK",		option.change_page,	pages.settings,		undefined,  undefined								],
]);

ds_menu_graphics = create_menu([
	["RESOLUTION",	option.shift,		change_resolution,	0,			["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]	],
	["WINDOW MODE", option.toggle,		change_window_mode, 1,			["FULLSCREEN", "WINDOWED"]												],
	["BACK",		option.change_page, pages.settings,     undefined,  undefined																],
]);
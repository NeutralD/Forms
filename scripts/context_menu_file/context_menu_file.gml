/// @func context_menu_file(contextMenu)
/// @param {real} contextMenu
var _contextMenu = argument0;
b_gui_add_item(_contextMenu,
	b_gui_context_menu_item_create("Exit", act_game_end));
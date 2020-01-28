/// @func context_menu_help(contextMenu)
/// @param {real} contextMenu
var _contextMenu = argument0;
b_gui_add_item(_contextMenu,
	b_gui_context_menu_item_create("About", act_empty));
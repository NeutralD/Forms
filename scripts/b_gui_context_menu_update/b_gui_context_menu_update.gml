/// @func b_gui_context_menu_update(contextMenu)
/// @desc Updates the context menu.
/// @param {real} contextMenu The id of the context menu.
var _contextMenu = argument0;
b_gui_container_update(_contextMenu);

// Clamp position
b_gui_widget_set_position(_contextMenu,
	min(b_gui_widget_get_x(_contextMenu), bGuiWindowWidth - b_gui_widget_get_width(_contextMenu)),
	min(b_gui_widget_get_y(_contextMenu), bGuiWindowHeight - b_gui_widget_get_height(_contextMenu)));
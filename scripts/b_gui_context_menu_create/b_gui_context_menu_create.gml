/// @func b_gui_context_menu_create()
/// @desc Creates a new context menu.
/// @return {real} The id of the created menu.
var _menu = b_gui_container_create(B_EGuiShape.ContextMenu);
_menu[? "scrUpdate"] = b_gui_context_menu_update;
_menu[? "scrDraw"] = b_gui_context_menu_draw;
b_gui_widget_set_depth(_menu, 2147483647);
return _menu;
/// @func b_gui_menu_bar_create()
/// @desc Creates a new menu bar.
/// @return {real} The id of the created menu bar.
var _menu = b_gui_canvas_create(B_EGuiShape.MenuBar);
b_gui_widget_set_height(_menu, bGuiLineHeight);
_menu[? "scrUpdate"] = b_gui_menu_bar_update;
_menu[? "scrDraw"] = b_gui_menu_bar_draw;
_menu[? "current"] = noone;
return _menu;
/// @func b_gui_menu_bar_update(menuBar)
/// @desc Updates the menu bar.
/// @param {real} menuBar The id of the menu bar.
var _menu = argument0;
b_gui_widgetset_update(_menu);

if (_menu[? "current"] != noone
	&& bGuiContextMenu == noone)
{
	_menu[? "current"] = noone;
	b_gui_request_redraw(_menu);
}
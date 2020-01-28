/// @func b_gui_context_menu_item_update(contextMenuItem)
/// @desc Updates the context menu item.
/// @param {real} contextMenuItem The id of the context menu item.
var _item = argument0;
b_gui_widget_update(_item);

if (mouse_check_button_pressed(mb_left)
	&& b_gui_widget_is_hovered(_item))
{
	var _scrAction = _item[? "scrAction"];
	if (_scrAction != noone)
	{
		script_execute(_scrAction);
		b_gui_widget_destroy(b_gui_widget_get_delegate(_item));
		bGuiContextMenu = noone;
	}
}
/// @func b_gui_widgetset_cleanup(widgetSet)
/// @desc Frees resources used by the widget set from memory.
/// @param {real} widgetSet The id of the widget set.
var _items = b_gui_widgetset_get_items(argument0);
while (ds_list_size(_items) > 0)
{
	var _item = _items[| 0];
	var _scrCleanUp = _item[? "scrCleanUp"];
	if (_scrCleanUp != noone)
	{
		script_execute(_scrCleanUp, _item);
	}
}
b_gui_widget_cleanup(argument0);
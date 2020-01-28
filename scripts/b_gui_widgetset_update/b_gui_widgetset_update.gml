/// @func b_gui_widgetset_update(widgetSet)
/// @desc Updates the widget set.
/// @param {real} widgetSet The id of the widget set.
b_gui_widget_update(argument0);

////////////////////////////////////////////////////////////////////////////////
// Update items
var _items = b_gui_widgetset_get_items(argument0);
for (var i/*:int*/= ds_list_size(_items) - 1; i >= 0; --i)
{
	var _item = _items[| i];
	if (!b_gui_widget_exists(_item))
	{
		ds_list_delete(_items, i);
	}
}
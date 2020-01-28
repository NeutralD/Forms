/// @func b_gui_add_item(widgetSet, item)
/// @desc Adds item to the widget set while preserving depth order.
/// @param {real} widgetSet The id of the widget set.
/// @param {real} item The id of the item to be added.
/// @return {real} The index where the item has been placed at.
var _items = b_gui_widgetset_get_items(argument0);
var _index = ds_list_size(_items);
while (_index > 0)
{
	if (b_gui_widget_get_depth(_items[| _index - 1]) > b_gui_widget_get_depth(argument1))
	{
		--_index;
	}
	else
	{
		break;
	}
}
ce_ds_list_insert_map(_items, _index, argument1);
b_gui_widget_set_delegate(argument1, argument0);
return _index;
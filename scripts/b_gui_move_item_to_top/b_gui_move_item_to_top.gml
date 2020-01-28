/// @func b_gui_move_item_to_top(item)
/// @desc Moves the item to the top while preserving depth order.
/// @param {real} item The id of the item to move.
var _item = argument0;
var _delegate = b_gui_widget_get_delegate(_item);

if (!b_gui_widget_exists(_delegate))
{
	exit;
}

var _items = b_gui_widgetset_get_items(_delegate);
var _n = ds_list_size(_items);
var _index = ds_list_find_index(_items, _item);

if (_index >= 0)
{
	var i = _index + 1;
	var _itemDepth = b_gui_widget_get_depth(_item);

	while (i < _n && b_gui_widget_get_depth(_items[| i]) <= _itemDepth)
	{
		++i;
	}

	ce_ds_list_insert_map(_items, i, _item);
	ds_list_delete(_items, _index);
}
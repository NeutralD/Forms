/// @func b_gui_widget_cleanup(widget)
/// @desc Frees resources used by the widget from memory.
/// @param {real} widget The id of the widget.
var _widget = argument0;
if (b_gui_widget_exists(_widget))
{
	// Remove from delegate
	var _delegate = b_gui_widget_get_delegate(_widget);
	if (b_gui_widget_exists(_delegate))
	{
		var _items = b_gui_widgetset_get_items(_delegate);
		var _pos = ds_list_find_index(_items, _widget);
		if (_pos >= 0)
		{
			ds_list_delete(_items, _pos);
		}
	}

	var _reference = _widget[? "reference"];
	if (!is_undefined(_reference))
	{
		variable_instance_set(id, _reference, noone);
	}

	// Destroy self
	ds_map_destroy(_widget);
}
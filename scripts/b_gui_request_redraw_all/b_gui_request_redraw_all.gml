/// @func b_gui_request_redraw_all(widget)
/// @desc Requests redraw of all child shapes.
/// @param {real} widget The id of the widget.
b_gui_widget_set_redraw(argument0, true);
var _items = b_gui_widgetset_get_items(argument0);
if (!is_undefined(_items))
{
	for (var i/*:int*/= ds_list_size(_items) - 1; i >= 0; --i)
	{
		b_gui_request_redraw_all(_items[| i]);
	}
}
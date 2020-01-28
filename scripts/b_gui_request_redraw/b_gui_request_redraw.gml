/// @func b_gui_request_redraw(widget)
/// @desc Pushes a redraw request of the given widget to the delegate.
/// @param {real} widget The id of the widget to redraw.
var _widget = argument0;
while (b_gui_widget_exists(_widget))
{
	b_gui_widget_set_redraw(_widget, true);
	_widget = b_gui_widget_get_delegate(_widget);
}
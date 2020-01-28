/// @func b_gui_widget_delegates_recursive(widget, item)
/// @desc Finds out whether the widget delegates the item.
/// @param {real} widget The id of the widget.
/// @param {real} item The id of the widget.
/// @return {bool} True if the widget delegates the item.
/// @note If the widget is not the delegate of the item, this
/// function is called recursively for the item's delegate,
/// until the widget is found or the item does not have delegate.
/// This way you can check for chained delegation. Wtf?!
if (!b_gui_widget_exists(argument1))
{
	return false;
}
var _delegate = b_gui_widget_get_delegate(argument1);
if (!b_gui_widget_exists(_delegate))
{
	return false;
}
if (_delegate == argument0)
{
	return true;
}
return b_gui_widget_delegates_recursive(argument0, _delegate);
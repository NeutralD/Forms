/// @func b_gui_widget_exists(widget)
/// @desc Finds out whether the widget exists.
/// @param {real} widget The id of the widget.
/// @return {bool} True if the widget does exist.
if (!is_real(argument0))
{
	return false;
}
return ds_exists(argument0, ds_type_map);
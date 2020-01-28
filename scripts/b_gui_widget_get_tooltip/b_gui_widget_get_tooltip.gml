/// @func b_gui_widget_get_tooltip(widget)
/// @desc Gets the tooltip of the widget.
/// @param {real} widget The id of the widget.
/// @return {string} The widget tooltip or an empty string if it does not have any.
var _tooltip = argument0[? "tooltip"];
if (is_undefined(_tooltip))
{
	return "";
}
return _tooltip;
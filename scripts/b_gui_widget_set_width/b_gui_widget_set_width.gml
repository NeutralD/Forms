/// @func b_gui_widget_set_width(widget, width)
/// @desc Sets the width of the widget.
/// @param {real} widget The id of the widget.
/// @param {real} width The new width.
gml_pragma("forceinline");
argument0[? "width"] = max(argument1, 1);
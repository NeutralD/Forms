/// @func b_gui_widget_set_height(widget, height)
/// @desc Sets the width of the widget.
/// @param {real} widget The id of the widget.
/// @param {real} height The new height.
gml_pragma("forceinline");
argument0[? "height"] = max(argument1, 1);
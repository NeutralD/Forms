/// @func b_gui_widget_set_position(widget, x, y)
/// @desc Sets the x and y position of the widget relative to it's delegate.
/// @param {real} widget The id of the widget.
/// @param {real} x The new x position.
/// @param {real} y The new y position.
gml_pragma("forceinline");
b_gui_widget_set_x(argument0, argument1);
b_gui_widget_set_y(argument0, argument2);
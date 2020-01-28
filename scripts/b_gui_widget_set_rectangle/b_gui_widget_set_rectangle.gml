/// @func b_gui_widget_set_rectangle(widget, x, y, width, height)
/// @desc Sets the x and y position of the widget relative to it's delegate and it's size.
/// @param {real} widget The id of the widget.
/// @param {real} x The new x position.
/// @param {real} y The new y position.
/// @param {real} width The new width.
/// @param {real} height The new height.
gml_pragma("forceinline");
b_gui_widget_set_x(argument0, argument1);
b_gui_widget_set_y(argument0, argument2);
b_gui_widget_set_width(argument0, argument3);
b_gui_widget_set_height(argument0, argument4);
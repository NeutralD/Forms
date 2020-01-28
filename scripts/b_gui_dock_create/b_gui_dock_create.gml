/// @func b_gui_dock_create([x, y, width, height])
/// @desc Creates a new dock.
/// @param {real} [x] The x positon to create the dock at.
/// @param {real} [y] The y positon to create the dock at.
/// @param {real} [width] The width of the dock.
/// @param {real} [height] The width of the dock.
/// @return {real} The id of the created dock.
var _dock = b_gui_widgetset_create(B_EGuiShape.Dock);
if (argument_count == 4)
{
	b_gui_widget_set_rectangle(_dock, argument[0], argument[1], argument[2], argument[3]);
}
b_gui_widget_set_depth(_dock, -16777216);
_dock[? "splitSize"] = 0.5;
_dock[? "splitType"] = B_EGuiSplit.Horizontal;
_dock[? "scrUpdate"] = b_gui_dock_update;
_dock[? "scrDraw"] = b_gui_dock_draw;
_dock[? "mouseOffset"] = 0;
_dock[? "padding"] = 3;
return _dock;
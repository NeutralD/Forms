/// @func b_gui_container_create([x, y, width, height])
/// @desc Creates a new scrollable container.
/// @param {real} [x] The x positon to create the container at.
/// @param {real} [y] The y positon to create the container at.
/// @param {real} [width] The width of the container.
/// @param {real} [height] The width of the container.
/// @return {real} The id of the created container.
var _container = b_gui_canvas_create(B_EGuiShape.Container);
if (argument_count == 4)
{
	b_gui_widget_set_rectangle(_container, argument[0], argument[1], argument[2], argument[3]);
}
b_gui_container_set_content(_container, noone);
_container[? "scrDraw"] = b_gui_container_draw;
_container[? "scrUpdate"] = b_gui_container_update;
_container[? "clickScroll"] = false;
_container[? "clickScrollMouseX"] = 0;
_container[? "clickScrollMouseY"] = 0;
ds_map_add_map(_container, "scrollbarHor", b_gui_hscrollbar_create(_container));
ds_map_add_map(_container, "scrollbarVer", b_gui_vscrollbar_create(_container));
return _container;
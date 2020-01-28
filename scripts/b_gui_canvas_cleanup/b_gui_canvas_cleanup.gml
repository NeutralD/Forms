/// @func b_gui_canvas_cleanup(canvas)
/// @desc Frees canvas resources from memory.
/// @param {real} canvas The id of the canvas.
var _surface = argument0[? "surface"];
if (surface_exists(_surface))
{
	surface_free(_surface);
}
b_gui_widgetset_cleanup(argument0);
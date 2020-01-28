/// @func b_gui_canvas_create([type])
/// @desc Creates a new canvas.
/// @param {B_EGuiShape} type The canvas type.
/// @return {real} The id of the createed canvas.
var _canvas;
if (argument_count == 1)
{
	_canvas = b_gui_widgetset_create(argument[0]);
}
else
{
	_canvas = b_gui_widgetset_create(B_EGuiShape.Set);
}
b_gui_canvas_set_surface(_canvas, noone);
b_gui_canvas_set_background(_canvas, B_EGuiColor.WindowBackground);
_canvas[? "scrDraw"] = b_gui_canvas_draw;
_canvas[? "scrCleanUp"] = b_gui_canvas_cleanup;
return _canvas;
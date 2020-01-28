/// @func b_gui_canvas_draw(canvas)
/// @desc Draws the canvas.
/// @param {canvas} The id of the canvas.
var _surface = b_gui_canvas_get_surface(argument0);
if (surface_exists(_surface))
{
	draw_surface(
		_surface,
		b_gui_widget_get_x(argument0),
		b_gui_widget_get_y(argument0));
}
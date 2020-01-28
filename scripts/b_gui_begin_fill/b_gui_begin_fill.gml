/// @func b_gui_begin_fill(canvas)
/// @desc Sets the canvas surface as the render target.
/// @param {real} canvas The id of the canvas.
/// @return {bool} True if the surface has been set as the render target.
var _canvas = argument0;

////////////////////////////////////////////////////////////////////////////////
// Check surface
var _surface = b_gui_canvas_get_surface(_canvas);
var _width = max(b_gui_widget_get_width(_canvas), 1);
var _height = max(b_gui_widget_get_height(_canvas), 1);

if (surface_exists(_surface))
{
	if (surface_get_width(_surface) != _width
		|| surface_get_height(_surface) != _height)
	{
		surface_resize(_surface, _width, _height);
		b_gui_request_redraw(_canvas);
	}
}
else
{
	_surface = surface_create(_width, _height);
	b_gui_request_redraw(_canvas);
}
b_gui_canvas_set_surface(_canvas, _surface);

////////////////////////////////////////////////////////////////////////////////
// Start filling
if (b_gui_widget_get_redraw(_canvas)
	&& !bGuiWidgetFilling)
{
	b_gui_widget_set_redraw(_canvas, false);
	var _scrollX = 0;
	var _scrollY = 0;
	var _scrollbarHor = _canvas[? "scrollbarHor"]
	var _scrollbarVer = _canvas[? "scrollbarVer"];
	if (!is_undefined(_scrollbarHor))
	{
		_scrollX = b_gui_scrollbar_get_scroll(_scrollbarHor)
			* b_gui_scrollbar_is_visible(_scrollbarHor);
	}
	if (!is_undefined(_scrollbarVer))
	{
		_scrollY = b_gui_scrollbar_get_scroll(_scrollbarVer)
			* b_gui_scrollbar_is_visible(_scrollbarVer);
	}
	surface_set_target(_surface);
	draw_clear(b_gui_canvas_get_background(_canvas));
	b_gui_matrix_set(-_scrollX, -_scrollY);
	bGuiWidgetFilling = _canvas;
	bGuiWidgetId = 0;
	return true;
}
return false;
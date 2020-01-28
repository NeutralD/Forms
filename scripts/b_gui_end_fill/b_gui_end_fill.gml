/// @func b_gui_end_fill(canvas)
/// @desc Finishes drawing into the canvas and resets the render target.
/// @param {real} The id of the canvas.
var _canvas = argument0;

if (bGuiWidgetFilling == _canvas)
{
	var _scrollX = 0;
	var _scrollY = 0;
	var _scrollbarVer = _canvas[? "scrollbarVer"];
	var _scrollbarHor = _canvas[? "scrollbarHor"];
	var _drawVer = false;
	var _drawHor = false;

	if (!is_undefined(_scrollbarVer))
	{
		_drawVer = b_gui_scrollbar_is_visible(_scrollbarVer);
		_scrollY = b_gui_scrollbar_get_scroll(_scrollbarVer) * _drawVer;
	}
	if (!is_undefined(_scrollbarHor))
	{
		_drawHor = b_gui_scrollbar_is_visible(_scrollbarHor);
		_scrollX = b_gui_scrollbar_get_scroll(_scrollbarHor) * _drawHor;
	}

	if (!is_undefined(_scrollbarVer))
	{
		var _height = b_gui_widget_get_height(_canvas) - _drawHor * b_gui_widget_get_height(_scrollbarHor);
		b_gui_widget_set_height(_scrollbarVer, _height);
		_scrollbarVer[? "size"] = _height;
		b_gui_scrollbar_calc_jump_and_thumb_size(_scrollbarVer);

		if (_drawVer)
		{
			b_gui_draw_item(_scrollbarVer, _scrollX + b_gui_widget_get_width(_canvas) - b_gui_widget_get_width(_scrollbarVer), _scrollY);
		}
	}

	if (!is_undefined(_scrollbarHor))
	{
		var _width = b_gui_widget_get_width(_canvas) - _drawVer * b_gui_widget_get_width(_scrollbarVer);
		b_gui_widget_set_width(_scrollbarHor, _width);
		_scrollbarHor[? "size"] = _width;
		b_gui_scrollbar_calc_jump_and_thumb_size(_scrollbarHor);

		if (_drawHor)
		{
			b_gui_draw_item(_scrollbarHor, _scrollX, _scrollY + b_gui_widget_get_height(_canvas) - b_gui_widget_get_height(_scrollbarHor));
		}
	}

	b_gui_matrix_restore();
	surface_reset_target();
	bGuiWidgetFilling = noone;
}
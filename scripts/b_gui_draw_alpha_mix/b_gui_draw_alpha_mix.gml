/// @func b_gui_draw_alpha_mix(x, y, alpha)
/// @desc Draws an alpha mix at the given position.
/// @param {real} x The x position to draw the alpha mix at.
/// @param {real} y The y position to draw the alpha mix at.
/// @param {real} alpha The alpha value to mix.
/// @return {real} The new mixed alpha.
var _container = bGuiWidgetFilling;
var _containerWidth = b_gui_widget_get_width(_container);
var _x = argument0;
var _y = argument1;
var _alpha = argument2;

// Check whether the sliders can be edited
var _edit = (mouse_check_button(mb_left)
	&& b_gui_widget_is_hovered(_container)
	&& bGuiInputActive == noone);

// Alpha
var _sliderWidth = _containerWidth - _x * 2;
b_gui_draw_rectangle(_x, _y, _sliderWidth, bGuiLineHeight, B_EGuiColor.Input);
b_gui_draw_rectangle(_x, _y, _sliderWidth * _alpha, bGuiLineHeight, merge_color(c_black, c_white, _alpha));

if (_edit)
{
	if (bGuiMouseX >= _x - 2
		&& bGuiMouseY > _y
		&& bGuiMouseX <= _x + _sliderWidth + 2
		&& bGuiMouseY < _y + bGuiLineHeight)
	{
		_alpha = max(0, min((bGuiMouseX - _x) / (_containerWidth - _x * 2), 1));
	}
}
_y += bGuiLineHeight + 4;

// Inputs
var _iw = round(_containerWidth - _x * 2);
var _input = b_gui_draw_input(_x, _y, _iw, _alpha, false);
if (!is_undefined(_input))
{
	_alpha = max(0, min(_input, 1));
}

// Return alpha
return _alpha;
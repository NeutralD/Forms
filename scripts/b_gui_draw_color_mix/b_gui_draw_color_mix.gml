/// @func b_gui_draw_color_mix(x, y, color)
/// @desc Draws a color mix at the given position.
/// @param {real} x The x position to draw the color mix at.
/// @param {real} y The y position to draw the color mix at.
/// @param {real} color The color to mix.
/// @return {real} The new mixed color.
var _x = argument0;
var _y = argument1;
var _color = argument2;
var _container = bGuiWidgetFilling;
var _containerWidth = b_gui_widget_get_width(_container);
var _red = color_get_red(_color);
var _green = color_get_green(_color);
var _blue = color_get_blue(_color);

// Check whether the sliders can be edited
var _edit = (b_gui_widget_is_hovered(_container)
	&& bGuiInputActive == noone);

// Red
var _sliderWidth = _containerWidth - _x * 2;
b_gui_draw_rectangle(_x, _y, _sliderWidth, bGuiLineHeight, B_EGuiColor.Input);
b_gui_draw_rectangle(_x, _y, _sliderWidth * (_red / 255), bGuiLineHeight, make_color_rgb(_red, 0, 0));
if (_edit)
{
	if (bGuiMouseX >= _x - 2
		&& bGuiMouseY > _y
		&& bGuiMouseX <= _x + _sliderWidth + 2
		&& bGuiMouseY < _y + bGuiLineHeight)
	{
		if (mouse_check_button(mb_left))
		{
			_red = round(clamp((bGuiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
		}
		bGuiColorShow = make_color_rgb(_red, _green, _blue);
	}
}
_y += bGuiLineHeight + 4;

// Green
b_gui_draw_rectangle(_x, _y, _sliderWidth, bGuiLineHeight, B_EGuiColor.Input);
b_gui_draw_rectangle(_x, _y, _sliderWidth * (_green / 255), bGuiLineHeight, make_color_rgb(0, _green, 0));
if (_edit)
{
	if (bGuiMouseX >= _x - 2
		&& bGuiMouseY > _y
		&& bGuiMouseX <= _x + _sliderWidth + 2
		&& bGuiMouseY < _y + bGuiLineHeight)
	{
		if (mouse_check_button(mb_left))
		{
			_green = round(clamp((bGuiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
		}
		bGuiColorShow = make_color_rgb(_red, _green, _blue);
	}
}
_y += bGuiLineHeight + 4;

// Blue
b_gui_draw_rectangle(_x, _y, _sliderWidth, bGuiLineHeight, B_EGuiColor.Input);
b_gui_draw_rectangle(_x, _y, _sliderWidth * (_blue / 255), bGuiLineHeight, make_color_rgb(0, 0, _blue));
if (_edit)
{
	if (bGuiMouseX >= _x - 2
		&& bGuiMouseY > _y
		&& bGuiMouseX <= _x + _sliderWidth + 2
		&& bGuiMouseY < _y + bGuiLineHeight)
	{
		if (mouse_check_button(mb_left))
		{
			_blue = round(clamp((bGuiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
		}
		bGuiColorShow = make_color_rgb(_red, _green, _blue);
	}
}
_y += bGuiLineHeight + 4;

// Inputs
var _input;
var _inputWidth = round((_sliderWidth - 16) / 3);

_input = b_gui_draw_input(_x, _y, _inputWidth, _red);
if (!is_undefined(_input))
{
	_red = clamp(round(_input), 0, 255);
}

_input = b_gui_draw_input(_x + _inputWidth + 8, _y, _inputWidth, _green);
if (!is_undefined(_input))
{
	_green = clamp(round(_input), 0, 255);
}

_input = b_gui_draw_input(_x + _inputWidth * 2 + 16, _y, _inputWidth, _blue);
if (!is_undefined(_input))
{
	_blue = clamp(round(_input), 0, 255);
}

return make_color_rgb(_red, _green, _blue);
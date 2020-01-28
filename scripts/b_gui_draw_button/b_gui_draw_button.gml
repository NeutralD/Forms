/// @func b_gui_draw_button(x, y, text[, width[, disabled]])
/// @param {real} x The x position of the button.
/// @param {real} y The y position of the button.
/// @param {string} text The button text.
/// @param {real} [width] The width of the button. Use -1 to calculate
/// automatically based on the text. Defaults to -1.
/// @param {bool} [disabled] True to disable the button.
/// @return {bool} True if the button was clicked.
var _x = argument[0];
var _y = argument[1];
var _text = argument[2];
var _width = (argument_count > 3) ? argument[3] : string_width(_text) + 16;
var _height = bGuiFontHeight + 8;
var _disabled = (argument_count > 4) ? argument[4] : false;
var _mouseOver = (!_disabled && b_gui_mouse_over(_x, _y, _width, _height));
var _colour = B_EGuiColor.Active;

if (_disabled)
{
	_colour = B_EGuiColor.Disabled;
}
else if (_mouseOver)
{
	_colour = B_EGuiColor.ActiveLight;
	bGuiCursor = cr_handpoint;
}

b_gui_draw_rectangle(_x, _y, _width, _height, _colour);
draw_set_halign(fa_center);
b_gui_draw_text_part(
	round(_x + _width * 0.5),
	round(_y + (_height - bGuiFontHeight) * 0.5),
	_text,
	_width);
draw_set_halign(fa_left);

return (_mouseOver && mouse_check_button_pressed(mb_left));
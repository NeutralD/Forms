/// @func b_gui_draw_checkbox(x, y, state)
/// @desc Draws a checkbox at the given position.
/// @param {real} x The x position to draw the checkbox at.
/// @param {real} y The y position to draw the checkbox at.
/// @param {bool} state The current state of the checkbox.
/// @return {bool} Return the new state of the checkbox.
var _sprite = B_SprGuiCheckbox;
var _state = argument2;
var _width = sprite_get_width(_sprite);
var _height = sprite_get_height(_sprite);
var _x = argument0;
var _y = argument1 + round((bGuiLineHeight - _height) * 0.5);
var _mouseOver = b_gui_mouse_over(_x, _y, _width, _height);

draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, B_EGuiColor.Input, 1);
if (_state)
{
	draw_sprite_ext(_sprite, 1, _x, _y, 1, 1, 0, B_EGuiColor.Text, 1);
}
if (_mouseOver && mouse_check_button_pressed(mb_left))
{
	return !_state;
}
return _state;
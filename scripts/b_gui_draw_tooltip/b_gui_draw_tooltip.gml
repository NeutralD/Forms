/// @func b_gui_draw_tooltip(x, y, text)
/// @desc Dras a tooltip at the given position.
/// @param {real} x The x position to draw the tooltip at.
/// @param {real} y The y position to draw the tooltip at.
/// @param {string} text The text of the tooltip.
var _x = argument0;
var _y = argument1;
var _text = argument2;
var _width = string_width(_text) + 16;
var _height = string_height(_text) + 8;

_x = min(_x, window_get_width() - _width - 1);
_y = min(_y, window_get_height() - _height - 1);

b_gui_draw_rectangle(_x, _y, _width, _height, B_EGuiColor.WindowBorder);
b_gui_draw_rectangle(_x + 1, _y + 1, _width - 2, _height - 2, B_EGuiColor.WindowBackground);
draw_text(_x + 8, _y + 4, _text);
/// @func b_gui_draw_popup_message(x, y, message)
/// @desc Draws a popup message at the given position.
/// @param {real} x The x position to draw popup the message at.
/// @param {real} y The y position to draw popup the message at.
/// @param {strnig} message The text of the popup message.
var _message = argument2;
var _w = string_width(_message) + 128;
var _h = string_height(_message) + 32;
var _x = argument0 - _w - 16;
var _y = argument1 - _h - 16;

b_gui_draw_rectangle(_x, _y, _w, _h, B_EGuiColor.WindowBorder);
b_gui_draw_rectangle(_x + 1, _y + 1, _w - 2, _h - 2, B_EGuiColor.WindowBackground);
draw_sprite(B_SprGuiWarning, 0, _x + 16, _y + _h / 2);
draw_text(_x + 96, _y + 16, _message);
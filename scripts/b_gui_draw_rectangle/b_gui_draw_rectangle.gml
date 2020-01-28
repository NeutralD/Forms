/// @func b_gui_draw_rectangle(x, y, width, height, color[, alpha])
/// @desc Draws a rectangle of the given size and color at the given position.
/// @param {real} x The x position to draw the rectangle at.
/// @param {real} y The y position to draw the rectangle at.
/// @param {real} width The width of the rectangle.
/// @param {real} height The height of the rectangle.
/// @param {real} color The color of the rectangle.
/// @param {real} [alpha] The alpha of the rectangle.
var _alpha = (argument_count > 5) ? argument[5] : 1;
draw_sprite_ext(
	B_SprGuiRectangle, 0,
	argument[0], argument[1],
	argument[2], argument[3],
	0, argument[4], _alpha);
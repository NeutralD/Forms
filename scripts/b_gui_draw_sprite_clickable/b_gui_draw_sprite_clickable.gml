/// @func b_gui_draw_sprite_clickable(sprite, subimg, x, y[, color])
/// @desc Draws a clickable sprite at the given position.
/// @param {real} sprite The id of the sprite.
/// @param {real} subimg The subimage of the sprite.
/// @param {real} x The x position to draw the sprite at.
/// @param {real} y The y position to draw the sprite at.
/// @param {real} [color] The color to blend the sprite with.
/// @return {bool} True if the sprite is clicked.
var _sprite = argument[0];
var _subimg = argument[1];
var _x = argument[2];
var _y = argument[3];
var _color = (argument_count > 4) ? argument[4] : c_white;
var _width = sprite_get_width(_sprite);
var _height = sprite_get_height(_sprite);
var _mouseOver = b_gui_mouse_over(_x, _y, _width, _height);
draw_sprite_ext(_sprite, _subimg, _x, _y, 1, 1, 0, _color, 1);
return (_mouseOver && mouse_check_button_pressed(mb_left));
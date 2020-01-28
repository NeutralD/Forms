/// @func b_gui_hscrollbar_draw(scrollbarHor)
/// @desc Draws the horizontal scrollbar.
/// @param {real} scrollbarHor The id of the horizontal scrollbar.
if (b_gui_scrollbar_is_visible(argument0))
{
	// Thumb
	var _x = b_gui_widget_get_x(argument0) + argument0[? "scroll"];
	var _y = b_gui_widget_get_y(argument0);
	var _thumbSize = argument0[? "thumbSize"];
	var _sprite = argument0[? "sprite"];
	var _spriteSize = argument0[? "spriteSize"];
	var _alpha = 0.75;
	draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, B_EGuiColor.Scrollbar, _alpha);
	draw_sprite_stretched_ext(_sprite, 1, _x + _spriteSize, _y, _thumbSize - _spriteSize * 2, b_gui_widget_get_height(argument0), B_EGuiColor.Scrollbar, _alpha);
	draw_sprite_ext(_sprite, 2, _x + _thumbSize - _spriteSize, _y, 1, 1, 0, B_EGuiColor.Scrollbar, _alpha);
}
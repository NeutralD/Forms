/// @func b_gui_vscrollbar_draw(scrollbarVer)
/// @desc Draws the vertical scrollbar.
/// @param {real} scrollbarVer The id of the vertical scrollbar.
if (b_gui_scrollbar_is_visible(argument0))
{
	// Thumb
	var _x = b_gui_widget_get_x(argument0);
	var _y = b_gui_widget_get_y(argument0) + argument0[? "scroll"];
	var _thumbSize = argument0[? "thumbSize"];
	var _sprite = argument0[? "sprite"];
	var _spriteSize = argument0[? "spriteSize"];
	var _alpha = 0.75;
	draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, B_EGuiColor.Scrollbar, _alpha);
	draw_sprite_stretched_ext(_sprite, 1, _x, _y + _spriteSize, b_gui_widget_get_width(argument0), _thumbSize - _spriteSize * 2, B_EGuiColor.Scrollbar, _alpha);
	draw_sprite_ext(_sprite, 2, _x, _y + _thumbSize - _spriteSize, 1, 1, 0, B_EGuiColor.Scrollbar, _alpha);
}
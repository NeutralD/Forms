/// @func b_gui_draw_list_item_eye(name, x, y, active, disabled[, highlighted])
/// @desc Draws a list item with an eye on the given position.
/// @param {string} name The item name.
/// @param {real} x The x position to draw the item at.
/// @param {real} y The y position to draw the item at.
/// @param {bool} active True if the item is currently selected.
/// @param {bool} disabled True to disable clicking on the item.
/// @param {bool} [highlighted] True to highlight the item.
/// @return {real} If the item is clicked, then 1 is returned.
/// If the eye is clicked, then 2 is returned.
/// In all other cases returns 0.
var _container = bGuiWidgetFilling;
var _containerWidth = b_gui_widget_get_width(_container);
var _text = string(argument[0]);
var _x = argument[1];
var _y = argument[2];
var _active = argument[3];
var _disabled = argument[4];
var _highlight = (argument_count > 5) ? argument[5] : false;

// Check mouse over
var _mouseOver = (b_gui_widget_is_hovered(_container)
	&& bGuiMouseY > _y
	&& bGuiMouseY < _y + bGuiLineHeight);

// Draw
b_gui_draw_list_item(_text, _x + bGuiLineHeight, _y, _active, _disabled, _highlight);
draw_sprite_ext(B_SprGuiMisc, 1, _x, _y, 1, 1, 0, merge_color(c_white, B_EGuiColor.Disabled, _disabled), 1);

// Click
if (mouse_check_button_pressed(mb_left)
	&& _mouseOver)
{
	if (bGuiMouseX < _x + bGuiLineHeight)
	{
		return 2;
	}
	if (!_disabled)
	{
		return 1;
	}
}
return 0;
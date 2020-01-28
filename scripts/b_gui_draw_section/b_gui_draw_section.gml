/// @func b_gui_draw_section(name, x, y, expanded)
/// @desc Draws a section at the given position.
/// @param {string} name The name of the section.
/// @param {real} x The x position to draw the section at.
/// @param {real} y The y position to draw the section at.
/// @param {bool} expanded True if the section is expanded.
/// @return {bool} True if the section is clicked.
var _container = bGuiWidgetFilling;
var _containerWidth = b_gui_widget_get_width(_container);
var _text = string(argument0);
var _x = argument1;
var _y = argument2;
var _state = argument3;

// Background
b_gui_draw_rectangle(0, _y, _containerWidth, bGuiLineHeight, B_EGuiColor.Section);

// Text
var _fnt = draw_get_font();
draw_set_font(B_FntGuiBold);
draw_text(bGuiLineHeight, _y + round((bGuiLineHeight - bGuiFontHeight) * 0.5), _text);
draw_set_font(_fnt);

// Icon
draw_sprite(B_SprGuiRoll, _state, 8, _y);

// Mouse over
if (b_gui_widget_is_hovered(_container)
	&& bGuiMouseY > _y
	&& bGuiMouseY < _y + bGuiLineHeight)
{
	// Click
	if (mouse_check_button_pressed(mb_left))
	{
		b_gui_request_redraw(_container);
		return true;
	}
}
return false;
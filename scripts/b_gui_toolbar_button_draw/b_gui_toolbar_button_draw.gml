/// @func b_gui_toolbar_button_draw(toolbarButton)
/// @desc Draws the toolbar button.
/// @param {real} toolbarButton The id of the toolbar button.
var _button = argument0;
var _x = b_gui_widget_get_x(_button);
var _y = b_gui_widget_get_y(_button);
var _width = b_gui_widget_get_width(_button);
var _height = b_gui_widget_get_height(_button);
var _backgroundColor = B_EGuiColor.WindowBackground;

if (b_gui_widget_is_hovered(_button))
{
	_backgroundColor = B_EGuiColor.Highlight;
}
b_gui_draw_rectangle(_x, _y, _width, _height, _backgroundColor);

if (_button[? "highlight"])
{
	b_gui_draw_rectangle(_x, _y + _height - 4, _width, 4, B_EGuiColor.Active);
}

draw_sprite(_button[? "sprite"], _button[? "subimage"], _x, _y);
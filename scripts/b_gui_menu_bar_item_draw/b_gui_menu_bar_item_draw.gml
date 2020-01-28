/// @func b_gui_menu_bar_item_draw(menuBarItem)
/// @desc Draws the menu bar item.
/// @param {real} menuBarItem The id of the menu bar item.
var _item = argument0;
var _x = b_gui_widget_get_x(_item);
var _y = b_gui_widget_get_y(_item);
var _height = b_gui_widget_get_height(_item);
var _name = _item[? "name"];
var _padding = 4;
var _width = b_gui_widget_get_width(_item);
if (_width == 1)
{
	_width = string_width(_name) + _padding * 2;
	b_gui_widget_set_width(_item, _width);
}

// Draw background
var _delegate = b_gui_widget_get_delegate(_item);
if (_delegate[? "current"] == _item[? "index"])
{
	b_gui_draw_rectangle(_x, _y, _width, _height, B_EGuiColor.Active, 1);
}
else if (b_gui_widget_is_hovered(_item))
{
	b_gui_draw_rectangle(_x, _y, _width, _height, B_EGuiColor.Highlight, 1);
}

// Text
draw_text(_x + _padding, _y + round((_height - bGuiFontHeight) * 0.5), _name);
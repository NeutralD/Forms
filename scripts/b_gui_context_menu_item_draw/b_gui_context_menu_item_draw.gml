/// @func b_gui_context_menu_item_draw(contextMenuItem)
/// @desc Dras the context menu item.
/// @param {real} contextMenuItem The id of the context menu item.
var _item = argument0;
var _x = b_gui_widget_get_x(_item);
var _y = b_gui_widget_get_y(_item);
var _width = b_gui_widget_get_width(_item);
var _height = b_gui_widget_get_height(_item);
var _name = _item[? "name"];
var _delegate = b_gui_widget_get_delegate(_item);
var _scrAction = _item[? "scrAction"];
var _textColor = B_EGuiColor.Disabled;
var _delegateWidth = b_gui_widget_get_width(_delegate);

var _shortcut = _item[? "shortcut"];
var _shortcutWidth = 0;

// Draw highlight
if (_scrAction != noone)
{
	_textColor = B_EGuiColor.Text;
	if (b_gui_widget_is_hovered(_item))
	{
		b_gui_draw_rectangle(_x, _y, _delegateWidth, _height, B_EGuiColor.Active, 1);
	}
}

// Draw item name
draw_text_color(_x + 8, _y + round((_height - bGuiFontHeight) * 0.5), _name,
	_textColor, _textColor, _textColor, _textColor, 1);

// Draw keyboard shortcut
if (_shortcut != noone)
{
	var _shortcutText = b_gui_keyboard_shortcut_to_string(_shortcut);
	_shortcutWidth = string_width(_shortcutText) + 8;
	draw_text_color(
		_x + _delegateWidth - _shortcutWidth,
		_y + round((_height - bGuiFontHeight) * 0.5),
		_shortcutText,
		_textColor, _textColor, _textColor, _textColor, 1);
	_shortcutWidth += bGuiFontWidth * 2;
}

b_gui_widget_set_width(_item, max(_x + string_width(_name) + _shortcutWidth, _delegateWidth));
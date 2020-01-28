/// @func b_gui_draw_list_item(name, x, y, active, disabled[, highlighted])
/// @desc Draws a list item on the given position.
/// @param {string} name The item name.
/// @param {real} x The x position to draw the item at.
/// @param {real} y The y position to draw the item at.
/// @param {bool} active True if the item is currently selected.
/// @param {bool} disabled True to disable clicking on the item.
/// @param {bool} [highlighted] True to highlight the item.
/// @return {real} If the item is clicked, then 1 is returned.
/// If the mouse cursor is currently over the item, then -1 is returned.
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
var _textColor = B_EGuiColor.Text;
var _backgroundColor = noone;

if (_active)
{
	_textColor = B_EGuiColor.TextSelected;
	_backgroundColor = B_EGuiColor.Active;
}
else if (!_disabled)
{
	if (_highlight
		|| _mouseOver)
	{
		_backgroundColor = B_EGuiColor.Highlight;
	}
}
else
{
	_textColor = B_EGuiColor.Disabled;
}

if (_backgroundColor != noone)
{
	b_gui_draw_rectangle(0, _y, _containerWidth, bGuiLineHeight, _backgroundColor);
}
if (_textColor != B_EGuiColor.Text)
{
	draw_text_color(_x, _y + round((bGuiLineHeight - bGuiFontHeight) * 0.5), _text,
		_textColor, _textColor, _textColor, _textColor, 1);
}
else
{
	draw_text(_x, _y + round((bGuiLineHeight - bGuiFontHeight) * 0.5), _text);
}

// Click
if (!_disabled
	&& _mouseOver)
{
	if (mouse_check_button_pressed(mb_left))
	{
		return 1;
	}
	return -1;
}
return 0;
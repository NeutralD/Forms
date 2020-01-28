/// @func b_gui_draw_input(x, y, width, value[, disabled[, defaultValue]])
/// @desc Draws an input at the given position.
/// @param {real} x The x position to draw the input at.
/// @param {real} y The y position to draw the input at.
/// @param {real} width The width of the input.
/// @param {real/string} value The value in the input.
/// @param {bool} [disabled] True to disable editing the input value.
/// @param {real/string} defaultValue The value to draw when the value is an empty string.
/// @return {real/string/undefined} The new input value when done editing or undefined while
/// editing.
var _padding = ceil(bGuiFontWidth * 0.5) + 1;
var _id = b_gui_encode_id(bGuiWidgetFilling, bGuiWidgetId++);
var _delegate = bGuiWidgetFilling;
var _x = argument[0];
var _xStart = _x;
var _y = argument[1];
var _yStart = _y;
var _width = argument[2];
var _active = (bGuiInputActive == _id);
var _value = _active ? bGuiInputString : string(argument[3]);
var _type = is_real(argument[3]);
var _stringLength = string_length(_value);
var _mouseOver = b_gui_mouse_over(_x, _y, _width, bGuiInputSpriteHeight);
var _maxCharCount = floor((_width - _padding * 2 ) / bGuiFontWidth);
var _disabled = (argument_count > 4) ? argument[4] : false;

////////////////////////////////////////////////////////////////////////////////
//
// Draw input
//

// Background
draw_sprite_ext(bGuiInputSprite, 0, _x, _y, 1, 1, 0, B_EGuiColor.Input, 1);
draw_sprite_stretched_ext(bGuiInputSprite, 1, _x + bGuiInputSpriteWidth, _y,
	_width - bGuiInputSpriteWidth * 2, bGuiInputSpriteHeight, B_EGuiColor.Input, 1);
draw_sprite_ext(bGuiInputSprite, 2, _x + _width - bGuiInputSpriteWidth, _y, 1, 1, 0, B_EGuiColor.Input, 1);

// Text
var _textX = _x + _padding;
var _textY = _y + round((bGuiInputSpriteHeight - bGuiFontHeight) * 0.5);
var _maxCharCount = floor((_width - _padding * 2) / bGuiFontWidth);
var _colSelection = B_EGuiColor.Active;

if (_mouseOver)
{
	bGuiCursor = cr_beam;
}

if (_active)
{
	if (bGuiInputIndex[1] - bGuiInputDrawIndexStart > _maxCharCount)
		bGuiInputDrawIndexStart += bGuiInputIndex[1] - bGuiInputDrawIndexStart - _maxCharCount;
	else if (bGuiInputDrawIndexStart > bGuiInputIndex[1])
		bGuiInputDrawIndexStart -= bGuiInputDrawIndexStart - bGuiInputIndex[1];

	var _drawValue = string_copy(_value, bGuiInputDrawIndexStart, _maxCharCount);

	if (bGuiInputIndex[0] == bGuiInputIndex[1])
	{
		// Beam
		var _beamX = _textX + bGuiFontWidth * (bGuiInputIndex[0] - bGuiInputDrawIndexStart);
		draw_text(_textX, _textY, _drawValue);
		b_gui_draw_rectangle(_beamX, _textY, 1, bGuiFontHeight, _colSelection);
	}
	else
	{
		// Selection
		var _minIndex = clamp(min(bGuiInputIndex[0], bGuiInputIndex[1]) - bGuiInputDrawIndexStart, 0, _stringLength);
		var _maxIndex = clamp(max(bGuiInputIndex[0], bGuiInputIndex[1]) - bGuiInputDrawIndexStart, 0, _stringLength);
		var _rectMinX = _textX + bGuiFontWidth * max(_minIndex, 0);
		var _rectMaxX = _textX + bGuiFontWidth * min(_maxIndex, _maxCharCount);

		// Text before selection
		draw_text(_textX, _textY, string_copy(_drawValue, 1, _minIndex));
		// Selection rectangle
		b_gui_draw_rectangle(_rectMinX, _textY, _rectMaxX - _rectMinX, bGuiFontHeight, _colSelection);
		// Selected text
		draw_text_color(_rectMinX, _textY, string_copy(_drawValue, _minIndex + 1, _maxIndex - _minIndex),
			B_EGuiColor.TextSelected, B_EGuiColor.TextSelected, B_EGuiColor.TextSelected, B_EGuiColor.TextSelected, 1);
		// Text after selection
		draw_text(_rectMaxX, _textY, string_delete(_drawValue, 1, _maxIndex));
	}

	// Draw highlight
	draw_sprite_ext(bGuiInputSprite, 3, _x, _y, 1, 1, 0, B_EGuiColor.Active, 1);
	draw_sprite_stretched_ext(bGuiInputSprite, 4, _x + bGuiInputSpriteWidth, _y,
		_width - bGuiInputSpriteWidth * 2, bGuiInputSpriteHeight, B_EGuiColor.Active, 1);
	draw_sprite_ext(bGuiInputSprite, 5, _x + _width - bGuiInputSpriteWidth, _y, 1, 1, 0, B_EGuiColor.Active, 1);
}
else
{
	var _drawValue = _value;
	if (argument_count > 5 && _value == "")
		_drawValue = argument[5];

	var _color;
	if (_disabled)
		_color = B_EGuiColor.Disabled;
	else
		_color = B_EGuiColor.Text;

	b_gui_draw_text_part(_textX, _textY, _drawValue, _maxCharCount * bGuiFontWidth, _color);
}

////////////////////////////////////////////////////////////////////////////////
//
// Input logic
//
if (mouse_check_button_pressed(mb_left)
	|| mouse_check_button_pressed(mb_right))
{
	// Select input
	if (_mouseOver && !_disabled)
	{
		if (bGuiInputActive == noone)
		{
			_active = true;
			bGuiInputActive = _id;
			bGuiInputString = _value;
			bGuiInputDrawIndexStart = 1;
			bGuiInputIndex[0] = 1;
			bGuiInputIndex[1] = 1;
			keyboard_string = "";
		}
	}
	else if (_active
		&& (!b_gui_widget_exists(bGuiContextMenu)
		|| (bGuiContextMenu != noone
		&& !b_gui_widget_delegates_recursive(bGuiContextMenu, bGuiWidgetHovered))))
	{
		// Return value when clicked outside of the input
		bGuiInputActive = noone;
		if (b_gui_widget_exists(_delegate))
			b_gui_request_redraw(_delegate);
		if (_type)
			return real(_value);
		return _value;
	}
}

if (_active)
{
	// Select text
	if (mouse_check_button(mb_left) /*&& _mouseOver*/)
	{
		var _index = clamp(round((bGuiMouseX - _xStart - _padding) / bGuiFontWidth) + bGuiInputDrawIndexStart, 1, _stringLength + 1);
		if (mouse_check_button_pressed(mb_left))
			bGuiInputIndex[0] = _index;
		bGuiInputIndex[1] = _index;
	}
	else if (mouse_check_button_pressed(mb_right) && _mouseOver)
	{
		// Open context menu
		var _contextMenu = b_gui_context_menu_create();
		b_gui_menu_input(_contextMenu);
		b_gui_show_context_menu(_contextMenu);

		// TODO: Select word in input on double click
		//var _index = clamp(round((bGuiMouseX - _xStart - _padding) / bGuiFontWidth) + bGuiInputDrawIndexStart, 1, _stringLength + 1);
		//var i, _char;
		//_char = string_char_at(_value, _index);
		//if (_char != " ")
		//{
		//	for (i = _index; i > 1; --i)
		//	{
		//		_char = string_char_at(_value, i);
		//		if (_char == " ")
		//		{
		//			++i;
		//			break;
		//		}
		//	}
		//	bGuiInputIndex[0] = i;

		//	for (i = _index; i < _stringLength + 1; ++i)
		//	{
		//		_char = string_char_at(_value, i);
		//		if (_char == " ")
		//			break;
		//	}
		//	bGuiInputIndex[1] = i;
		//}
	}

	if (keyboard_check_pressed(vk_enter))
	{
		// Return value when enter is pressed
		bGuiInputActive = noone;
		if (b_gui_widget_exists(_delegate))
		{
			b_gui_request_redraw(_delegate);
		}
		if (_type)
		{
			if (string_digits(_value) == "")
			{
				return argument[3];
			}
			return real(_value);
		}
		return _value;
	}
	else if (keyboard_check_pressed(vk_escape))
	{
		// Return original value
		bGuiInputActive = noone;
		return argument[3];
	}
}

return undefined;
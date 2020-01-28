/// @func b_gui_cnt_question(container)
/// @desc Draws content of a question.
/// @param {real} container The id of the container.
/// @return {array} The content size.
var _container = argument0;
var _delegate = b_gui_widget_get_delegate(_container);
var _text = _delegate[? "text"];
var _buttons = _delegate[? "buttons"];
var _buttonCount = array_length_1d(_buttons);
var _buttonWidth = 100;
var _spacing = 8;
var _buttonWidthTotal = (_buttonCount * _buttonWidth) + (_buttonCount - 1) * _spacing;
var _contentX = _spacing;
var _contentY = _spacing;
var _contentWidth = 0;

// Text
draw_text(_contentX, _contentY, _text);
_contentY += string_height(_text) + _spacing;

_contentWidth = max(string_width(_text), _buttonWidthTotal) + _spacing * 2;

// Buttons
_contentX = round((_contentWidth - _buttonWidthTotal) * 0.5);

for (var i/*:int*/= 0; i < _buttonCount; ++i)
{
	var _btn = _buttons[i];
	if (b_gui_draw_button(_contentX, _contentY, _btn[0], 100))
	{
		var _action = _btn[1];
		if (_action != noone)
		{
			script_execute(_action);
		}
		b_gui_widget_destroy(_delegate);
	}
	_contentX += _buttonWidth + _spacing;
}

_contentY += bGuiLineHeight + _spacing;

return [_contentWidth, _contentY + _spacing];
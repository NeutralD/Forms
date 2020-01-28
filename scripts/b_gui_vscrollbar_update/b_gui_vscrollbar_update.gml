/// @func b_gui_vscrollbar_update(scrollbarVer)
/// @desc Updates the vertical scrollbar.
/// @param {real} scrollbarVer The id of the vertical scrollbar.
var _scrollbar = argument0;

_scrollbar[? "size"] = b_gui_widget_get_height(_scrollbar);
if (!keyboard_check(vk_control))
{
	b_gui_scrollbar_update(_scrollbar);
}
else
{
	b_gui_widget_update(_scrollbar);
}

// Start scrolling with mouse click
// TODO: Fix scrollbars so that the commented code works
if (bGuiWidgetHovered == _scrollbar
	&& mouse_check_button_pressed(mb_left))
{
	var _y = _scrollbar[? "scroll"];

	if (bGuiWidgetHovered == _scrollbar
		&& bGuiMouseY > _y
		&& bGuiMouseY < _y + _scrollbar[? "thumbSize"])
	{
		//_scrollbar[? "mouseOffset"] = _y - bGuiMouseY;
		_scrollbar[? "mouseOffset"] = bGuiWindowMouseY;
		bGuiWidgetActive = _scrollbar;
	}
}

// Stop scrolling
if (mouse_check_button_released(mb_left)
	&& bGuiWidgetActive == _scrollbar)
{
	bGuiWidgetActive = noone;
}

// Handle scrolling
if (b_gui_scrollbar_is_visible(_scrollbar))
{
	var _scroll = _scrollbar[? "scroll"];
	if (bGuiWidgetActive == _scrollbar)
	{
		//_scroll = bGuiMouseY + _scrollbar[? "mouseOffset"];
		_scroll += bGuiWindowMouseY - _scrollbar[? "mouseOffset"];
		_scrollbar[? "mouseOffset"] = bGuiWindowMouseY;
	}
	_scroll = clamp(_scroll, 0, b_gui_widget_get_height(_scrollbar) - _scrollbar[? "thumbSize"]);
	_scrollbar[? "scroll"] = _scroll;
}
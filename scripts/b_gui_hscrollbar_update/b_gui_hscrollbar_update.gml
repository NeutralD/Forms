/// @func b_gui_hscrollbar_update(scrollbarHor)
/// @desc Updates the horizontal scrollbar.
/// @param {real} scrollbarHor The id of the horizontal scrollbar.
var _scrollbar = argument0;
_scrollbar[? "size"] = b_gui_widget_get_width(_scrollbar);

if (keyboard_check(vk_control))
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
	var _x = _scrollbar[? "scroll"];

	if (bGuiWidgetHovered == _scrollbar
		&& bGuiMouseX > _x
		&& bGuiMouseX < _x + _scrollbar[? "thumbSize"])
	{
		//_scrollbar[? "mouseOffset"] = _x - bGuiMouseX;
		_scrollbar[? "mouseOffset"] = bGuiWindowMouseX;
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
		//_scroll = bGuiMouseX + _scrollbar[? "mouseOffset"];
		_scroll += bGuiWindowMouseX - _scrollbar[? "mouseOffset"];
		_scrollbar[? "mouseOffset"] = bGuiWindowMouseX;
	}
	_scroll = clamp(_scroll, 0, b_gui_widget_get_width(_scrollbar) - _scrollbar[? "thumbSize"]);
	_scrollbar[? "scroll"] = _scroll;
}
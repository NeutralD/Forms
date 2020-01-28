/// @func b_gui_scrollbar_is_visible(scrollbar)
/// @desc Finds out whether the scrollbar is visible.
/// @param {real} scrollbar The id of the scrollbar.
/// @return {bool} True if the scrollbar is visible.
var _scrollbar = argument0;
var _delegate = b_gui_widget_get_delegate(_scrollbar);
if (_delegate[? "scrollbarHor"] == _scrollbar)
{
	if (_scrollbar[? "contentSize"] > b_gui_widget_get_width(_delegate))
	{
		return true;
	}
}
if (_delegate[? "scrollbarVer"] == _scrollbar)
{
	if (_scrollbar[? "contentSize"] > b_gui_widget_get_height(_delegate))
	{
		return true;
	}
}
return false;
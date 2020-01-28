/// @func b_gui_scrollbar_update(scrollbar)
/// @desc Updates the scrollbar.
/// @param {real} scrollbar The id of the scrollbar.
var _scrollbar = argument0;
b_gui_widget_update(_scrollbar);
b_gui_scrollbar_calc_jump_and_thumb_size(_scrollbar);

var _delegate = b_gui_widget_get_delegate(_scrollbar);

if (b_gui_widget_is_hovered(_scrollbar)
	|| (b_gui_widget_exists(_delegate)
	&& (b_gui_widget_is_hovered(_delegate)
	|| b_gui_widget_delegates_recursive(_delegate, bGuiWidgetHovered))))
{
	var _wheel = (mouse_wheel_down() - mouse_wheel_up()) * 2 * bGuiFontHeight / _scrollbar[? "scrollJump"];
	if (_wheel != 0)
	{
		_scrollbar[? "scroll"] = clamp(_scrollbar[? "scroll"] + _wheel, 0, _scrollbar[? "size"] - _scrollbar[? "thumbSize"]);
		b_gui_request_redraw(_scrollbar);
	}
}
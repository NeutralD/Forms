/// @func b_gui_push_mouse_coordinates(widget)
/// @desc Pushes mouse coordinates to be relative to the widget.
/// @param {real} widget The id of the widget.
var _widget = argument0;
var _x = b_gui_widget_get_x(_widget);
var _y = b_gui_widget_get_y(_widget);
var _scrollX = 0;
var _scrollY = 0;
var _scrollbarHor = _widget[? "scrollbarHor"]
var _scrollbarVer = _widget[? "scrollbarVer"];

if (!is_undefined(_scrollbarHor))
{
	_scrollX = b_gui_scrollbar_get_scroll(_scrollbarHor) * b_gui_scrollbar_is_visible(_scrollbarHor);
}
if (!is_undefined(_scrollbarVer))
{
	_scrollY = b_gui_scrollbar_get_scroll(_scrollbarVer) * b_gui_scrollbar_is_visible(_scrollbarVer);
}

bGuiMouseX += -_x + _scrollX;
bGuiMouseY += -_y + _scrollY;

var _delegate = b_gui_widget_get_delegate(_widget);
if (b_gui_widget_exists(_delegate))
{
	b_gui_push_mouse_coordinates(_delegate);
}
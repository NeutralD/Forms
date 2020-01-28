/// @func b_gui_container_update(container)
/// @desc Updates the container.
/// @param {real} container The id of the container.
var _container = argument0;
var _scrollbarHor = _container[? "scrollbarHor"];
var _scrollbarVer = _container[? "scrollbarVer"];
b_gui_widgetset_update(_container);

// Click scroll
if (mouse_check_button_pressed(mb_middle)
	&& b_gui_widget_is_hovered(_container)
	&& !b_gui_widget_exists(bGuiWidgetActive))
{
	_container[? "clickScroll"] = true;
	_container[? "clickScrollMouseX"] = bGuiWindowMouseX;
	_container[? "clickScrollMouseY"] = bGuiWindowMouseY;
	bGuiWidgetActive = _container;
}

if (bGuiWidgetActive == _container
	&& _container[? "clickScroll"])
{
	_scrollbarHor[? "scroll"] += (bGuiWindowMouseX - _container[? "clickScrollMouseX"])
								/ _scrollbarHor[? "scrollJump"] * 0.1;
	_scrollbarVer[? "scroll"] += (bGuiWindowMouseY - _container[? "clickScrollMouseY"])
								/ _scrollbarVer[? "scrollJump"] * 0.1;

	_scrollbarHor[? "scroll"] = clamp(_scrollbarHor[? "scroll"], 0, _scrollbarHor[? "size"] - _scrollbarHor[? "thumbSize"]);
	_scrollbarVer[? "scroll"] = clamp(_scrollbarVer[? "scroll"], 0, _scrollbarVer[? "size"] - _scrollbarVer[? "thumbSize"]);

	if (!mouse_check_button(mb_middle))
	{
		_container[? "clickScroll"] = false;
		bGuiWidgetActive = noone;
	}
	bGuiCursor = cr_drag;
}
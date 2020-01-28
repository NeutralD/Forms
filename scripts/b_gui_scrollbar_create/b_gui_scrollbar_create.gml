/// @func b_gui_scrollbar_create(delegate)
/// @desc Creates a new scrollbar.
/// @param {real} delegate The id of the scrollbars delegate.
/// @return {real} The id of the created scrollbar.
var _scrollbar = b_gui_widget_create(B_EGuiShape.Scrollbar);
b_gui_widget_set_delegate(_scrollbar, argument0);
b_gui_widget_set_depth(_scrollbar, 16777216);
_scrollbar[? "sprite"] = noone;
_scrollbar[? "spriteSize"] = 1;
_scrollbar[? "contentSize"] = 0.1;
_scrollbar[? "scrUpdate"] = b_gui_scrollbar_update;
_scrollbar[? "size"] = 1;
_scrollbar[? "scroll"] = 0;
_scrollbar[? "scrollJump"] = 1;
_scrollbar[? "mouseOffset"] = 0;
_scrollbar[? "minThumbSize"] = 12;
_scrollbar[? "thumbSize"] = _scrollbar[? "minThumbSize"];
return _scrollbar;
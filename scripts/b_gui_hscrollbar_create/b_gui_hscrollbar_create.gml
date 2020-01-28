/// @func b_gui_hscrollbar_create(delegate)
/// @desc Creates a new horizontal scrollbar.
/// @param {real} delegate The id of the scrollbars delegate.
/// @return {real} The id of the created scrollbar.
var _scrollbarHor = b_gui_scrollbar_create(argument0);
var _sprite = B_SprGuiHScrollbar;
_scrollbarHor[? "sprite"] = _sprite;
_scrollbarHor[? "spriteSize"] = sprite_get_width(_sprite);
b_gui_widget_set_height(_scrollbarHor, sprite_get_height(_sprite));
_scrollbarHor[? "scrUpdate"] = b_gui_hscrollbar_update;
_scrollbarHor[? "scrDraw"] = b_gui_hscrollbar_draw;
return _scrollbarHor;
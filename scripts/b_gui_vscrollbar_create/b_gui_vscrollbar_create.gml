/// @func b_gui_vscrollbar_create(delegate)
/// @desc Creates a new horizontal scrollbar.
/// @param {real} delegate The id of the scrollbars delegate.
/// @return {real} The id of the created scrollbar.
var _scrollbarVer = b_gui_scrollbar_create(argument0);
var _sprite = B_SprGuiVScrollbar;
_scrollbarVer[? "sprite"] = _sprite;
_scrollbarVer[? "spriteSize"] = sprite_get_height(_sprite);
b_gui_widget_set_width(_scrollbarVer, sprite_get_width(_sprite));
_scrollbarVer[? "scrUpdate"] = b_gui_vscrollbar_update;
_scrollbarVer[? "scrDraw"] = b_gui_vscrollbar_draw;
return _scrollbarVer;
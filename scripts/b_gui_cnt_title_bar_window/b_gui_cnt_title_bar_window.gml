/// @func b_gui_cnt_title_bar_window(container)
/// @desc Draws the content of a Window Title Bar to the container.
/// @param {real} container The id of the container.
/// @return {array} The content size.
var _container = argument0;
var _containerWidth = b_gui_widget_get_width(_container);

var _delegate = b_gui_widget_get_delegate(_container);
var _selectedShape = b_gui_get_selected_widget();
if (_selectedShape == _delegate
	|| b_gui_widget_delegates_recursive(_delegate, _selectedShape))
{
	draw_clear(B_EGuiColor.Active);
}

var _x = 4;
var _y = 4;
var _title = _container[? "title"];
b_gui_draw_text_bold(_x, _y + round((bGuiLineHeight - bGuiFontHeight) * 0.5), _title);

if (_delegate[? "closeable"]
	&& b_gui_draw_sprite_clickable(B_SprGuiWindowCross, 0, _containerWidth - bGuiLineHeight, _y + 4, B_EGuiColor.WindowButton))
{
	b_gui_widget_destroy(_delegate);
}

_y += bGuiLineHeight + 4;

return [_containerWidth, _y];
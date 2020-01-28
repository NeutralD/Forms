/// @func b_gui_cnt_title_bar(container)
/// @desc Draws the content of a Title Bar to the container.
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
draw_sprite(B_SprGuiPanel, 0, _x, _y);
b_gui_draw_text_bold(_x + bGuiLineHeight + 4, _y + round((bGuiLineHeight - bGuiFontHeight) * 0.5), _title);
_y += bGuiLineHeight + 4;

return [_containerWidth, _y];
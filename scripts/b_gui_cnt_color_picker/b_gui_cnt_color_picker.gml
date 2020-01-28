/// @func b_gui_cnt_color_picker(container)
/// @desc Draws the content of a Color Picker to the container.
/// @param {real} container The id of the container.
/// @return {array} The content size.
var _container = argument0;
var _containerWidth = b_gui_widget_get_width(_container);
var _contentX = 8;
var _contentY = 4;

var _colorBackup = _container[? "color"];
var _color = b_gui_draw_color_mix(_contentX, _contentY, _colorBackup);
_container[? "color"] = _color;
_contentY += b_gui_color_mix_get_height() + 4;

var _alphaBackup = _container[? "alpha"];
var _alpha = b_gui_draw_alpha_mix(_contentX, _contentY, _alphaBackup);
_container[? "alpha"] = _alpha;
_contentY += b_gui_alpha_mix_get_height() + 4;

if ((_color != _colorBackup || _alpha != _alphaBackup)
	&& ds_map_exists(_container, "redrawContainer"))
{
	b_gui_request_redraw(_container[? "redrawContainer"]);
}

return [_containerWidth, _contentY];
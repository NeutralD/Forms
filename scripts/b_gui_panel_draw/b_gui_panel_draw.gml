/// @func b_gui_panel_draw(panel)
/// @desc Draws the panel.
/// @param {real} panel The id of the panel.
var _panel = argument0;
var _panelW = b_gui_widget_get_width(_panel);
var _panelH = b_gui_widget_get_height(_panel);
var _titleBar = b_gui_panel_get_title_bar(_panel);
var _container = b_gui_panel_get_container(_panel);

b_gui_matrix_push(b_gui_widget_get_x(_panel), b_gui_widget_get_y(_panel));

b_gui_widget_set_width(_titleBar, _panelW);
b_gui_draw_item(_titleBar, 0, 0);
b_gui_widget_set_height(_titleBar,
	clamp(b_gui_container_get_content_height(_titleBar), 1, _panelH - 1));

var _border = 1;
var _titleBarHeight = b_gui_widget_get_height(_titleBar);
b_gui_widget_set_size(_container,
	_panelW - _border * 2,
	max(_panelH - _titleBarHeight - _border, 1));

var _selectedShape = b_gui_get_selected_widget();
var _colorBorder = B_EGuiColor.WindowBorder;
if (_selectedShape == _panel
	|| b_gui_widget_delegates_recursive(_panel, _selectedShape))
{
	_colorBorder = B_EGuiColor.Active;
}
b_gui_draw_rectangle(0, _titleBarHeight, _panelW, _panelH - _titleBarHeight, _colorBorder);
b_gui_draw_item(_container, _border, _titleBarHeight);

b_gui_matrix_restore();
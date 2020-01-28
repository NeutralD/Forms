/// @func b_gui_window_draw(window)
/// @desc Draws the window.
/// @param {real} window The id of the window.
var _window = argument0;
var _windowW = b_gui_widget_get_width(_window);
var _windowH = b_gui_widget_get_height(_window);
var _border = _window[? "border"];
var _titleBar = b_gui_window_get_title_bar(_window);
var _container = b_gui_window_get_container(_window);

b_gui_matrix_push(b_gui_widget_get_x(_window), b_gui_widget_get_y(_window));

// Shadow and border
b_gui_draw_shadow(0, 0, _windowW, _windowH, B_EGuiColor.Shadow, B_EGuiColor.ShadowAlpha);
var _selectedShape = b_gui_get_selected_widget();
var _colorBorder = B_EGuiColor.WindowBorder;
if (_selectedShape == _window
	|| b_gui_widget_delegates_recursive(_window, _selectedShape))
{
	_colorBorder = B_EGuiColor.Active;
}
b_gui_draw_rectangle(0, 0, _windowW, _windowH, _colorBorder);

// Title
b_gui_widget_set_width(_titleBar, _windowW - _border * 2);
b_gui_draw_item(_titleBar, _border, 0);
var _titleBarHeight = b_gui_container_get_content_height(_titleBar);
b_gui_widget_set_height(_titleBar, _titleBarHeight);

// Content
b_gui_widget_set_size(_container,
	_windowW - _border * 2,
	max(_windowH - _titleBarHeight - _border, 1));
b_gui_draw_item(_container, _border, _titleBarHeight);

b_gui_matrix_restore();

b_gui_widget_set_height(_window, max(b_gui_widget_get_height(_window), _titleBarHeight + _border));
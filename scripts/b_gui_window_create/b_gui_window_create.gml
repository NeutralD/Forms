/// @func b_gui_window_create(title)
/// @desc Creates a new window.
/// @param {string} title The window title.
/// @return {real} The id of the created window.
var _window = b_gui_widgetset_create(B_EGuiShape.Window);
var _titleBar = b_gui_container_create();
var _container = b_gui_container_create();
_window[? "titleBar"] = _titleBar;
_titleBar[? "title"] = argument0;
_titleBar[? "height"] = bGuiLineHeight;
_titleBar[? "content"] = b_gui_cnt_title_bar_window;
b_gui_canvas_set_background(_titleBar, B_EGuiColor.WindowBorder);
_window[? "container"] = _container;
b_gui_add_item(_window, _titleBar);
b_gui_add_item(_window, _container);
_window[? "scrUpdate"] = b_gui_window_update;
_window[? "scrDraw"] = b_gui_window_draw;
_window[? "closeable"] = true;
_window[? "resizable"] = true;
_window[? "resize"] = B_EGuiResize.None;
_window[? "drag"] = false;
_window[? "mouseOffsetX"] = 0;
_window[? "mouseOffsetY"] = 0;
_window[? "border"] = 4;
b_gui_widget_set_size(_window, 300, 200);
b_gui_widget_set_depth(_window, 16777216);
return _window;
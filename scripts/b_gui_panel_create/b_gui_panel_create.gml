/// @func b_gui_panel_create(title)
/// @desc Creates a new panel.
/// @param {string} title The name of the panel.
/// @return {real} The id of the created panel.
var _panel = b_gui_widgetset_create(B_EGuiShape.Panel);
var _titleBar = b_gui_container_create();
var _container = b_gui_container_create();
_panel[? "titleBar"] = _titleBar;
_titleBar[? "title"] = argument0;
_titleBar[? "content"] = b_gui_cnt_title_bar;
b_gui_canvas_set_background(_titleBar, B_EGuiColor.WindowBorder);
_panel[? "container"] = _container;
b_gui_add_item(_panel, _titleBar);
b_gui_add_item(_panel, _container);
_panel[? "scrDraw"] = b_gui_panel_draw;
return _panel;
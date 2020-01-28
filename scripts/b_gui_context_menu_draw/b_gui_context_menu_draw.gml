/// @func b_gui_context_menu_draw(contextMenu)
/// @desc Draws the context menu.
/// @param {real} contextMenu The id of the context menu.
var _contextMenu = argument0;
if (b_gui_begin_fill(_contextMenu))
{
	var _contextMenuItems = b_gui_widgetset_get_items(_contextMenu);
	var _x = 0;
	var _y = 4;
	var _width = 1;

	// Draw items
	var _size = ds_list_size(_contextMenuItems);
	for (var i/*:int*/= 0; i < _size; ++i)
	{
		var _item = _contextMenuItems[| i];
		b_gui_draw_item(_item, 0, _y);
		_width = max(_width, b_gui_widget_get_width(_item));
		_y += b_gui_widget_get_height(_item);
	}

	// Set context menu size
	var _contextMenuWidth = clamp(_width, 200, bGuiWindowWidth);
	var _contextMenuHeight = min(_y + 4, bGuiWindowHeight);
	b_gui_widget_set_width(_contextMenu, _contextMenuWidth);
	b_gui_widget_set_height(_contextMenu, _contextMenuHeight);
	b_gui_container_set_content_width(_contextMenu, _contextMenuWidth);
	b_gui_container_set_content_height(_contextMenu, _contextMenuHeight);
	b_gui_end_fill(_contextMenu);
}

// Draw context menu
var _surface = b_gui_canvas_get_surface(_contextMenu);
if (surface_exists(_surface))
{
	var _x = b_gui_widget_get_x(_contextMenu);
	var _y = b_gui_widget_get_y(_contextMenu);
	var _width = surface_get_width(_surface);
	var _height = surface_get_height(_surface);
	if (_width > 1
		 && _height > 1)
	{
		//b_gui_draw_shadow(_x, _y, _width, _height, B_EGuiColor.Shadow, B_EGuiColor.ShadowAlpha);
		b_gui_draw_rectangle(_x - 1, _y - 1, _width + 2, _height + 2, B_EGuiColor.WindowBorder, 1);
	}
}
b_gui_canvas_draw(_contextMenu);
/// @func b_gui_menu_bar_draw(menuBar)
/// @desc Draws the menu bar.
/// @param {real} menuBar The id of the menu bar.
var _menu = argument0;
if (b_gui_begin_fill(_menu))
{
	var _x = 0;
	var _y = 0;
	var _items = b_gui_widgetset_get_items(_menu);
	var _size = ds_list_size(_items);

	for (var i/*:int*/= 0; i < _size; ++i)
	{
		var _item = _items[| i];
		b_gui_draw_item(_item, _x, _y);
		_x += b_gui_widget_get_width(_item);
	}

	b_gui_end_fill(_menu);
}

b_gui_canvas_draw(_menu);
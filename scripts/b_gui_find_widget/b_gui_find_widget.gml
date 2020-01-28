/// @func b_gui_find_widget(items, x, y)
/// @desc Recursively finds widget on the given position in the list of shapes.
/// @param {real} items The list of shapes.
/// @param {real} x The x position to find a widget at.
/// @param {real} y The y position to find a widget at.
/// @return {real} The id of the found widget or noone.
var _items = argument0;
var _mouseX = argument1;
var _mouseY = argument2;

for (var i/*:int*/= ds_list_size(_items) - 1; i >= 0; --i)
{
	var _item = _items[| i];
	var _x = b_gui_widget_get_x(_item);
	var _y = b_gui_widget_get_y(_item);

	if (_mouseX > _x
		&& _mouseY > _y
		&& _mouseX < _x + b_gui_widget_get_width(_item)
		&& _mouseY < _y + b_gui_widget_get_height(_item))
	{
		b_gui_widget_set_redraw(_item, true);

		// Skip hidden scrollbars
		if (b_gui_widget_get_type(_item) == B_EGuiShape.Scrollbar
			&& !b_gui_scrollbar_is_visible(_item))
		{
			continue;
		}

		// Check if scrollbars are hovered
		var _scrollX = 0;
		var _scrollY = 0;
		var _scrollbarHor = _item[? "scrollbarHor"]
		var _scrollbarVer = _item[? "scrollbarVer"];
		var _scrollbars = ds_list_create();

		if (!is_undefined(_scrollbarHor))
		{
			ds_list_add(_scrollbars, _scrollbarHor);
			_scrollX = b_gui_scrollbar_get_scroll(_scrollbarHor) * b_gui_scrollbar_is_visible(_scrollbarHor);
		}
		if (!is_undefined(_scrollbarVer))
		{
			ds_list_add(_scrollbars, _scrollbarVer);
			_scrollY = b_gui_scrollbar_get_scroll(_scrollbarVer) * b_gui_scrollbar_is_visible(_scrollbarVer);
		}

		var _hovered = noone;
		if (!ds_list_empty(_scrollbars))
		{
			_hovered = b_gui_find_widget(_scrollbars, _mouseX - _x + _scrollX, _mouseY - _y + _scrollY);
		}
		ds_list_destroy(_scrollbars);
		if (b_gui_widget_exists(_hovered))
		{
			return _hovered;
		}

		// Find hovered item
		var _subItems = b_gui_widgetset_get_items(_item);
		if (!is_undefined(_subItems))
		{
			var _hovered = b_gui_find_widget(_subItems, _mouseX - _x + _scrollX, _mouseY - _y + _scrollY);
			if (b_gui_widget_exists(_hovered))
			{
				return _hovered;
			}
		}
		return _item;
	}
}
return noone;
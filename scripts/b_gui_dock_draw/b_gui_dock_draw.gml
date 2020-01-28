/// @func b_gui_dock_draw(dock)
/// @desc Draws the dock.
/// @param {real} dock The id of the dock.
var _dock = argument0;
var _x = b_gui_widget_get_x(_dock);
var _y = b_gui_widget_get_y(_dock);
var _items = b_gui_widgetset_get_items(_dock);
var _itemCount = ds_list_size(_items);

b_gui_matrix_push(_x, _y);

if (_itemCount == 1)
{
	var _item = _items[| 0];
	b_gui_widget_set_size(_item,
		b_gui_widget_get_width(_dock),
		b_gui_widget_get_height(_dock));
	b_gui_draw_item(_item, 0, 0);
}
else if (_itemCount == 2)
{
	var _width = b_gui_widget_get_width(_dock);
	var _height = b_gui_widget_get_height(_dock);
	var _splitType = _dock[? "splitType"];
	var _splitSize = _dock[? "splitSize"];
	var _padding = _dock[? "padding"];
	var _middle;

	if (_splitType == B_EGuiSplit.Horizontal)
	{
		_middle = round(_width * _splitSize);
	}
	else
	{
		_middle = round(_height * _splitSize);
	}

	// Left
	var _left = _items[| 0];
	if (_splitType == B_EGuiSplit.Horizontal)
	{
		b_gui_widget_set_size(_left,
			_middle - _padding,
			_height);
	}
	else
	{
		b_gui_widget_set_size(_left,
			_width,
			_middle - _padding);
	}
	b_gui_draw_item(_left, 0, 0);

	// Right
	var _right = _items[| 1];
	if (_splitType == B_EGuiSplit.Horizontal)
	{
		b_gui_widget_set_rectangle(_right,
			_middle + _padding,
			0,
			_width - _middle - _padding,
			_height);
	}
	else
	{
		b_gui_widget_set_rectangle(_right,
			0,
			_middle + _padding,
			_width,
			_height - _middle - _padding);
	}
	b_gui_draw_item(_right);
}

b_gui_matrix_restore();
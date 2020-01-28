/// @func b_gui_dock_update(dock)
/// @desc Updates the dock.
/// @param {real} dock The id of the dock.
var _dock = argument0;
b_gui_widgetset_update(_dock);

// Start resizing
if (!b_gui_widget_exists(bGuiWidgetActive)
	&& b_gui_widget_is_hovered(_dock))
{
	var _x = b_gui_widget_get_x(_dock);
	var _y = b_gui_widget_get_y(_dock);
	var _width = b_gui_widget_get_width(_dock);
	var _height = b_gui_widget_get_height(_dock);
	var _splitType = _dock[? "splitType"];
	var _splitSize = _dock[? "splitSize"];
	var _padding = _dock[? "padding"];
	var _middle;

	if (_splitType == B_EGuiSplit.Horizontal)
	{
		_middle = round(_width * _splitSize);

		// Horizontally
		if (bGuiMouseX >= _middle - _padding
			&& bGuiMouseX < _middle + _padding)
		{
			bGuiCursor = cr_size_we;
			if (mouse_check_button_pressed(mb_left))
			{
				bGuiWidgetActive = _dock;
				_dock[? "mouseOffset"] = _middle - bGuiMouseX;
			}
		}
	}
	else
	{
		_middle = round(_height * _splitSize);

		// Vertically
		if (bGuiMouseY >= _middle - _padding
			&& bGuiMouseY < _middle + _padding)
		{
			bGuiCursor = cr_size_ns;
			if (mouse_check_button_pressed(mb_left))
			{
				bGuiWidgetActive = _dock;
				_dock[? "mouseOffset"] = _middle - bGuiMouseY;
			}
		}
	}
}

// Resize
if (bGuiWidgetActive == _dock)
{
	if (mouse_check_button(mb_left))
	{
		if (_dock[? "splitType"] == B_EGuiSplit.Horizontal)
		{
			_dock[? "splitSize"] = (bGuiMouseX + _dock[? "mouseOffset"]) / b_gui_widget_get_width(_dock);
			bGuiCursor = cr_size_we;
		}
		else
		{
			_dock[? "splitSize"] = (bGuiMouseY + _dock[? "mouseOffset"]) / b_gui_widget_get_height(_dock);
			bGuiCursor = cr_size_ns;
		}
		_dock[? "splitSize"] = clamp(_dock[? "splitSize"], 0.1, 0.9);
	}
	else
	{
		bGuiWidgetActive = noone;
	}
}
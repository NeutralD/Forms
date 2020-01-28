/// @func b_gui_menu_bar_item_update(menuBarItem)
/// @desc Updates the menu bar item.
/// @param {real} menuBarItem The id of the menu bar item.
var _item = argument0;
b_gui_widget_update(_item);

var _index = _item[? "index"];
var _scrContextMenu = _item[? "scrContextMenu"];
if (_scrContextMenu != noone
	&& b_gui_widget_is_hovered(_item))
{
	var _delegate = b_gui_widget_get_delegate(_item);
	var _current = _delegate[? "current"];

	if (mouse_check_button_pressed(mb_left))
	{
		if (_current == noone)
		{
			// Enable opening the context menus for the menu bar
			_delegate[? "current"] = _index;
		}
		else
		{
			// Close context menu
			_delegate[? "current"] = noone;
			b_gui_widget_destroy(bGuiContextMenu);
		}
	}

	// Open the context menu for this item
	if (_delegate[? "current"] != noone)
	{
		_delegate[? "current"] = _index;
		if (_current != _index)
		{
			var _contextMenu = b_gui_context_menu_create();
			script_execute(_scrContextMenu, _contextMenu);
			b_gui_show_context_menu(
				_contextMenu,
				b_gui_widget_get_x(_item),
				b_gui_widget_get_y(_delegate) + b_gui_widget_get_height(_delegate) + 1);
		}
	}
}
/// @func b_gui_update()
/// @desc Updates GUI.
bGuiTooltip = "";
bGuiWindowWidth = window_get_width();
bGuiWindowHeight = window_get_height();
bGuiWindowMouseX = window_mouse_get_x();
bGuiWindowMouseY = window_mouse_get_y();
bGuiMouseX = bGuiWindowMouseX;
bGuiMouseY = bGuiWindowMouseY;
b_gui_widget_set_size(bGuiRoot, bGuiWindowWidth, bGuiWindowHeight);

// Find hovered widget
var _lastHoveredShape = bGuiWidgetHovered;
if (!b_gui_widget_exists(_lastHoveredShape))
{
	_lastHoveredShape = noone;
}
bGuiWidgetHovered = b_gui_find_widget(b_gui_widgetset_get_items(bGuiRoot), bGuiMouseX, bGuiMouseY);

// Redraw last hovered widget
if (b_gui_widget_exists(_lastHoveredShape)
	&& bGuiWidgetHovered != _lastHoveredShape)
{
	b_gui_request_redraw(_lastHoveredShape);
}

// Reset active widget if it does not exist
if (!b_gui_widget_exists(bGuiWidgetActive))
{
	bGuiWidgetActive = noone;
}

// Reset selected widget if it does not exist
if (!b_gui_widget_exists(bGuiWidgetSelected))
{
	bGuiWidgetSelected = noone;
}

// Redraw active widget and push mouse coordinates
if (b_gui_widget_exists(bGuiWidgetActive))
{
	b_gui_request_redraw(bGuiWidgetActive);
	b_gui_push_mouse_coordinates(bGuiWidgetActive);
}
else if (b_gui_widget_exists(bGuiWidgetHovered))
{
	b_gui_push_mouse_coordinates(bGuiWidgetHovered);
}

////////////////////////////////////////////////////////////////////////////////
// Handle keyboard shortcuts
if (keyboard_check_pressed(vk_anykey))
{
	b_gui_log_key(keyboard_key);
}

if (mouse_check_button_pressed(mb_any))
{
	b_gui_log_key(mouse_button);
}

//var _text = "";
for (var i/*:int*/= ds_list_size(bGuiKeyLog) - 1; i >= 0; --i)
{
	var _isMouseButton = (bGuiKeyLog[| i] == mb_left
		|| bGuiKeyLog[| i] == mb_right
		|| bGuiKeyLog[| i] == mb_middle);
	if ((!_isMouseButton && !keyboard_check(bGuiKeyLog[| i]))
		|| (_isMouseButton && !mouse_check_button(bGuiKeyLog[| i])))
	{
		ds_list_delete(bGuiKeyLog, i);
		continue;
	}
	//_text = string(bGuiKeyLog[| i]) + ", " + _text;
}
//show_debug_message(_text);

// Global
var _shortcuts = bGuiRoot[? "keyboardShortcuts"];
if (!is_undefined(_shortcuts))
{
	for (var i/*:int*/= ds_list_size(_shortcuts) - 1; i >= 0; --i)
	{
		b_gui_keyboard_shortcut_update(_shortcuts[| i]);
	}
}

// Selected widget
if (b_gui_widget_exists(bGuiWidgetSelected))
{
	var _shortcuts = bGuiWidgetSelected[? "keyboardShortcuts"];
	if (!is_undefined(_shortcuts))
	{
		for (var i/*:int*/= ds_list_size(_shortcuts) - 1; i >= 0; --i)
		{
			b_gui_keyboard_shortcut_update(_shortcuts[| i]);
		}
	}
}

// Update input
if (bGuiInputActive != noone)
{
	b_gui_input_update(bGuiInputActive);
}

// Close context menu
if (mouse_check_button_pressed(mb_left)
	&& bGuiContextMenu != noone
	&& !b_gui_widget_is_hovered(bGuiContextMenu)
	&& !b_gui_widget_delegates_recursive(bGuiContextMenu, bGuiWidgetHovered))
{
	b_gui_widget_destroy(bGuiContextMenu);
	bGuiContextMenu = noone;
}

// Save mouse press position
if (mouse_check_button_pressed(mb_right))
{
	bGuiMousePressX = bGuiWindowMouseX;
	bGuiMousePressY = bGuiWindowMouseY;
}
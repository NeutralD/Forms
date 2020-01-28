/// @func b_gui_add_keyboard_shortcut(widget, keyboardShortcut)
/// @desc Adds keyboard shortcut to the widget.
/// @pram {real} widget The id of the widget to add the keyboard shortcut to.
/// @param {real} keyboardShortcut The id of the keyboard shortcut.
var _widget = argument0;
if (is_undefined(_widget[? "keyboardShortcuts"]))
{
	ds_map_add_list(_widget, "keyboardShortcuts", ds_list_create());
}
ce_ds_list_add_map(_widget[? "keyboardShortcuts"], argument1);
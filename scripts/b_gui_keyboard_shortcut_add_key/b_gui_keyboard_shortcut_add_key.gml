/// @func b_gui_keyboard_shortcut_add_key(keyboardShortcut, key)
/// @desc Adds key to the keyboard shortcut.
/// @param {real} keyboardShortcut The id of the keyboard shortcut.
/// @param {real} key The key.
gml_pragma("forceinline");
ds_list_add(argument0[? "keys"], argument1);
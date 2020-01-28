/// @func b_gui_keyboard_shortcut_to_string(keyboardShortcut)
/// @desc Converts the keyboard shortcut into a human readable string.
/// @param {real} keyboardShortcut The id of the keyboard shortcut.
/// @return {string} The keyboard shortcut converted into a human readable string.
var _shortcut = argument0;
var _keys = _shortcut[? "keys"];
var _string = "";
var _size = ds_list_size(_keys);
for (var i/*:int*/= 0; i < _size - 1; ++i)
{
	_string += ce_key_to_string(_keys[| i]) + "+";
}
if (_size >= 1)
{
	_string += ce_key_to_string(_keys[| _size - 1]);
}
return _string;
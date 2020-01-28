/// @func b_gui_keyboard_shortcut_update(keyboardShortcut)
/// @desc Updates the keyboard shortcut.
/// @param _shortcut
var _shortcut = argument0;
var _action = _shortcut[? "scrAction"];
if (_action == noone
	|| bGuiInputActive != noone)
{
	exit;
}

var _keys = _shortcut[? "keys"];
var _size = ds_list_size(_keys);

if (_size != ds_list_size(bGuiKeyLog))
{
	exit;
}

for (var i/*:int*/= _size - 1; i >= 0; --i)
{
	if (bGuiKeyLog[| i] != _keys[| i])
	{
		exit;
	}
}

ds_list_delete(bGuiKeyLog, _size - 1);
script_execute(_action);
/// @func b_gui_log_key(key)
/// @desc Adds the key to the key log.
/// @param {real} key The key to be added to the key log.
var _key = argument0;

switch (_key)
{
case vk_lshift:
case vk_rshift:
	_key = vk_shift;
	break;

case vk_lalt:
case vk_ralt:
	_key = vk_alt;
	break;

case vk_lcontrol:
case vk_rcontrol:
	_key = vk_control;
	break;
}

ds_list_add(bGuiKeyLog, _key);
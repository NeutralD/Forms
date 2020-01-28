/// @func b_gui_toolbar_button_create(name, sprite, subimg, tooltip, action)
/// @desc Creates a new toolbar button.
/// @param {string} name The name of the button.
/// @param {real} sprite The button sprite.
/// @param {real} subimg The sprite subimage.
/// @param {string} tooltip The tooltip text.
/// @param {real} action The script that will be executed on click.
/// @return {real} The id of the created toolbar button.
var _tool = b_gui_widget_create(B_EGuiShape.ToolbarButton);
_tool[? "name"] = argument0;
_tool[? "sprite"] = argument1;
_tool[? "subimage"] = argument2;
_tool[? "tooltip"] = argument3;
_tool[? "scrAction"] = argument4;
_tool[? "scrUpdate"] = b_gui_toolbar_button_update;
_tool[? "scrDraw"] = b_gui_toolbar_button_draw;
b_gui_widget_set_size(
	_tool,
	sprite_get_width(argument1),
	sprite_get_height(argument1));
_tool[? "highlight"] = false;
return _tool;
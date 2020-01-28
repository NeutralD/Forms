/// @func b_gui_toolbar_button_update(toolbarButton)
/// @desc Updates the toolbar button.
/// @param {real} toolbarButton The id of the toolbar button.
b_gui_widget_update(argument0);

if (b_gui_widget_is_hovered(argument0)
	&& mouse_check_button_pressed(mb_left))
{
	var _scrAction = argument0[? "scrAction"];
	if (_scrAction != noone)
	{
		script_execute(_scrAction);
	}
}
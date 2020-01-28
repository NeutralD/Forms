/// @func b_gui_destroy()
/// @desc Destroys GUI.
for (var i/*:int*/= 0; i < ds_list_size(bGuiWidgets); ++i)
{
	var _widget = bGuiWidgets[| i];
	var _scrCleanUp = _widget[? "scrCleanUp"];
	if (_scrCleanUp != noone)
	{
		script_execute(_scrCleanUp, _widget);
	}
}
ds_list_destroy(bGuiWidgets);
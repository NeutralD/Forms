/// @func b_gui_widgetset_create([type])
/// @desc Creates a new widget set.
/// @param {B_EGuiShape} type The widget set type.
/// @return {real} The id of the created widget set.
var _widgetSet;
if (argument_count == 1)
{
	_widgetSet = b_gui_widget_create(argument[0]);
}
else
{
	_widgetSet = b_gui_widget_create(B_EGuiShape.Set);
}
_widgetSet[? "scrUpdate"] = b_gui_widgetset_update;
_widgetSet[? "scrCleanUp"] = b_gui_widgetset_cleanup;
ds_map_add_list(_widgetSet, "items", ds_list_create());
return _widgetSet;
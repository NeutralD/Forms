/// @func b_gui_widget_create([type])
/// @desc Creates a new widget.
/// @param {B_EGuiShape} [type] The type of the widget.
/// @return {real} The id of the created widget.
var _widget = ds_map_create();
if (argument_count == 1)
{
	b_gui_widget_set_type(_widget, argument[0]);
}
else
{
	b_gui_widget_set_type(_widget, B_EGuiShape.Blank);
}
b_gui_widget_set_depth(_widget, noone);
b_gui_widget_set_delegate(_widget, noone);
b_gui_widget_set_x(_widget, 0);
b_gui_widget_set_y(_widget, 0);
b_gui_widget_set_width(_widget, 1);
b_gui_widget_set_height(_widget, 1);
b_gui_widget_set_depth(_widget, 0);
b_gui_widget_set_redraw(_widget, true);

_widget[? "scrUpdate"] = b_gui_widget_update;
_widget[? "scrDraw"] = noone;
_widget[? "scrCleanUp"] = b_gui_widget_cleanup;

_widget[? "reference"] = undefined;

return _widget;
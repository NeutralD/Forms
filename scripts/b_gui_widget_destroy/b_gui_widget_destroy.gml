/// @func b_gui_widget_destroy(widget)
/// @desc Destroys the widget.
/// @param {real} widget The id of the widget.
gml_pragma("forceinline");
if (b_gui_widget_exists(argument0))
{
	ds_stack_push(bGuiDestroyStack, argument0);
}
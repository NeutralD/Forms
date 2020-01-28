/// @func b_gui_widget_is_selected(widget)
/// @desc Gets whether the widget is selected.
/// @param {real} widget The id of the widget.
/// @return {bool} True if the widget is selected.
gml_pragma("forceinline");
return (bGuiWidgetSelected == argument0);
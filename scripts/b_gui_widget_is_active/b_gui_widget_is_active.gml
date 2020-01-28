/// @func b_gui_widget_is_active(widget)
/// @desc Gets whether the widget is active.
/// @param {real} widget The id of the widget.
/// @return {bool} True if the widget is active.
gml_pragma("forceinline");
return (bGuiWidgetActive == argument0);
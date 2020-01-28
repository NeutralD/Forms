/// @func b_gui_widget_is_hovered(widget)
/// @desc Gets whether the widget is hovered.
/// @param {real} widget The id of the widget.
/// @return {bool} True if the widget is hovered.
gml_pragma("forceinline");
return (bGuiWidgetHovered == argument0
	&& (bGuiWidgetActive == argument0
	|| !b_gui_widget_exists(bGuiWidgetActive)));
/// @func b_gui_mouse_over(x, y, width, height)
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} height
/// @return {bool}
gml_pragma("forceinline");
return (b_gui_widget_is_hovered(bGuiWidgetFilling)
	&& bGuiMouseX > argument0
	&& bGuiMouseY > argument1
	&& bGuiMouseX < argument0 + argument2
	&& bGuiMouseY < argument1 + argument3);
/// @func b_gui_widget_get_redraw(widget)
/// @desc Gets the redraw state of the widget.
/// @param {real} widget The id of the widget.
/// @return {bool} The redraw state of the widget.
gml_pragma("forceinline");
return argument0[? "redraw"];
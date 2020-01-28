/// @func b_gui_widgetset_get_items(widgetSet)
/// @desc Gets the list of items of the widget set.
/// @param {real} widgetSet The id of the widget set.
/// @return {real/undefiend} The list of items of the widget set or
/// undefined, if the widget is not a widget set.
gml_pragma("forceinline");
return argument0[? "items"];
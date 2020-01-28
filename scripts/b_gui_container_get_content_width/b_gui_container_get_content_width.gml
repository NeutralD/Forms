/// @func b_gui_container_get_content_width(container)
/// @desc Gets the width of the container's content.
/// @param {real} container The id of the container.
/// @return {real} The width of the container's content.
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "scrollbarHor"], "contentSize");
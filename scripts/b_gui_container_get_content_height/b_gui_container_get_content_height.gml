/// @func b_gui_container_get_content_height(container)
/// @desc Gets the height of the container's content.
/// @param {real} container The id of the container.
/// @return {real} The height of the container's content.
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "scrollbarVer"], "contentSize");
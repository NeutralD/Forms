/// @func b_gui_container_set_content_width(container, contentWidth)
/// @desc Sets width of the content of the given
/// container to the given value.
/// @param {real} container The id of the container.
/// @param {real} contentWidth The new width of the container's content.
gml_pragma("forceinline");
ds_map_set(argument0[? "scrollbarHor"], "contentSize", max(1, argument1));
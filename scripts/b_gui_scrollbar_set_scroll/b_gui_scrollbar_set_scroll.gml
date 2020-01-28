/// @func b_gui_scrollbar_set_scroll(scrollbar, scroll)
/// @desc Sets scrollbar's scroll to the given value.
/// @param {real} scrollbar The id of the scrollbar.
/// @param {real} scroll The new scroll value.
gml_pragma("forceinline");
argument0[? "scroll"] = argument1 / argument0[? "scrollJump"];
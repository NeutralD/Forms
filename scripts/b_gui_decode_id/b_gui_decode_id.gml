/// @func b_gui_decode_id(id)
/// @desc Gets the dynamic widget delegate from its id.
/// @param {real} id The id of the dynamic widget.
/// @return {real} The id of the delegate.
gml_pragma("forceinline");
return ((argument0 div 100000) - 1);
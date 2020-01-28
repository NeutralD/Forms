/// @func b_gui_encode_id(delegate, number)
/// @desc Gets the id of the dynamic widget.
/// @param {real} delegate The id of the delegate.
/// @param {real} number The unique number of the dynamic widget.
/// @return {real} The id of the dynamic widget.
gml_pragma("forceinline");
return ((argument0 + 1) * 100000 + argument1);
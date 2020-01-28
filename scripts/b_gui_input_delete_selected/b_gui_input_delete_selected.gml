/// @func b_gui_input_delete_selected()
/// @desc Deletes selected part of input text.
var _minIndex = min(bGuiInputIndex[0], bGuiInputIndex[1]);
bGuiInputString = string_delete(
	bGuiInputString,
	_minIndex,
	abs(bGuiInputIndex[0] - bGuiInputIndex[1]));
bGuiInputIndex[0] = _minIndex;
bGuiInputIndex[1] = _minIndex;
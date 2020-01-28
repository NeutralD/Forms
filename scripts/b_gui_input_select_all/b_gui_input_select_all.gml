/// @func b_gui_input_select_all()
/// @desc Selects all text in currently active input.
var _strlen = string_length(bGuiInputString);
bGuiInputIndex[0] = 1;
bGuiInputIndex[1] = _strlen + 1;
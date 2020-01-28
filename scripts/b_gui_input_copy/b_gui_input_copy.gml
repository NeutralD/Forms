/// @func b_gui_input_copy()
/// @desc Copies selected part of text of currently active input
/// to the clipboard.
if (bGuiInputIndex[0] != bGuiInputIndex[1])
{
	clipboard_set_text(
		string_copy(
			bGuiInputString,
			min(bGuiInputIndex[0], bGuiInputIndex[1]),
			abs(bGuiInputIndex[0] - bGuiInputIndex[1])));
}
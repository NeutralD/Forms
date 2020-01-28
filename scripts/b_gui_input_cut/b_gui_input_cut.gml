/// @func b_gui_input_cut()
/// @desc Cuts selected part of text in currently active input.
if (bGuiInputIndex[0] != bGuiInputIndex[1])
{
	clipboard_set_text(
		string_copy(
			bGuiInputString,
			min(bGuiInputIndex[0], bGuiInputIndex[1]),
			abs(bGuiInputIndex[0] - bGuiInputIndex[1])));
	b_gui_input_delete_selected();
}
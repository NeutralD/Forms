/// @func b_gui_input_paste()
/// @desc Pastes text from the clipboard to currently active input.
if (clipboard_has_text())
{
	// Delete selected part
	if (bGuiInputIndex[0] != bGuiInputIndex[1])
	{
		b_gui_input_delete_selected();
	}

	// Insert string
	bGuiInputString = string_insert(
		clipboard_get_text(),
		bGuiInputString,
		bGuiInputIndex[0]);
	bGuiInputIndex[0] += string_length(clipboard_get_text());
	bGuiInputIndex[1] = bGuiInputIndex[0];
}
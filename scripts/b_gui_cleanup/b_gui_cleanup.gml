/// @func b_gui_cleanup()
/// @desc Frees resources used by GUI from memory.
b_gui_widget_cleanup(bGuiRoot);
ds_stack_destroy(bGuiMatrixStack);
ds_stack_destroy(bGuiDestroyStack);
ds_list_destroy(bGuiKeyLog);
ds_map_destroy(bGuiKsInputCut);
ds_map_destroy(bGuiKsInputCopy);
ds_map_destroy(bGuiKsInputPaste);
ds_map_destroy(bGuiKsInputDelete);
ds_map_destroy(bGuiKsInputSelectAll);
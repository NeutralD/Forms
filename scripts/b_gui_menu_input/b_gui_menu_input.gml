/// @func b_gui_menu_input(contextMenu)
/// @desc Adds options for an input menu to the context menu.
/// @param {real} contextMenu The id of the context menu.
var _contextMenu = argument0;
b_gui_add_item(_contextMenu, b_gui_context_menu_item_create("Cut", b_gui_input_cut, bGuiKsInputCut));
b_gui_add_item(_contextMenu, b_gui_context_menu_item_create("Copy", b_gui_input_copy, bGuiKsInputCopy));
b_gui_add_item(_contextMenu, b_gui_context_menu_item_create("Paste", b_gui_input_paste, bGuiKsInputPaste));
b_gui_add_item(_contextMenu, b_gui_context_menu_item_create("Delete", b_gui_input_delete, bGuiKsInputDelete));
b_gui_add_item(_contextMenu, b_gui_context_menu_item_create("Select All", b_gui_input_select_all, bGuiKsInputSelectAll));
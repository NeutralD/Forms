/// @func b_gui_menu_bar_add_item(menuBar, menuBarItem)
/// @desc Adds the item to the menu bar.
/// @param {real} menuBar The id of the menu bar.
/// @param {real} menuBarItem The id of the menu bar item.
gml_pragma("forceinline");
argument1[? "index"] = b_gui_add_item(argument0, argument1);
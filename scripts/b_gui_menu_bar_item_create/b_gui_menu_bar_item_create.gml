/// @func b_gui_menu_bar_item_create(name, scrContextMenu)
/// @desc Creates a new menu bar item.
/// @param {string} name The name of the item.
/// @param {real} scrContextMenu The script that opens a context menu for this item or noone.
/// @return {real} The id of the created menu bar item.
var _item = b_gui_widget_create(B_EGuiShape.MenuBarItem);
_item[? "name"] = argument0;
_item[? "scrContextMenu"] = argument1;
_item[? "scrUpdate"] = b_gui_menu_bar_item_update;
_item[? "scrDraw"] = b_gui_menu_bar_item_draw;
_item[? "index"] = noone;
b_gui_widget_set_height(_item, bGuiLineHeight);
return _item;
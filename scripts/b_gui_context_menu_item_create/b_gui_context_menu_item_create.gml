/// @func b_gui_context_menu_item_create(name, action[, shortcut[, tooltip])
/// @desc Creates a new context menu item with given name.
/// @param {string} name The of the context menu item.
/// @param {real} action The script that will be executed on click, or noone.
/// @param {real} [shortcut] The id of the keyboard shortcut for this item.
/// @param {string} [tooltip] The tooltip text that will show up on mouse over.
/// If you don't specify the action then this is not used.
/// @return {real} The id of the created context menu item.
var _item = b_gui_widget_create(B_EGuiShape.ContextMenuItem);
_item[? "name"] = argument[0];
_item[? "scrAction"] = argument[1];
_item[? "scrUpdate"] = b_gui_context_menu_item_update;
_item[? "scrDraw"] = b_gui_context_menu_item_draw;
b_gui_widget_set_height(_item, bGuiLineHeight);
_item[? "shortcut"] = (argument_count > 2) ? argument[2] : noone;
if (argument_count > 3 && _item[? "scrAction"] != noone)
{
	b_gui_widget_set_tooltip(_item, argument[3]);
}
return _item;
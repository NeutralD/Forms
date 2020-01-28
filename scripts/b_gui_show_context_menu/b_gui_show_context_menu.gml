/// @func b_gui_show_context_menu(contextMenu[, x, y])
/// @desc Shows the context menu.
/// @param {real} contextMenu The id of the context menu to show.
/// @param {real} [x] The x position to show the context menu at.
/// @param {real} [y] The y position to show the context menu at.
/// @note If the position coordinates are not specified, then the current
/// window mouse position is used.
if (bGuiContextMenu)
{
	b_gui_widget_destroy(bGuiContextMenu);
}
bGuiContextMenu = argument[0];
if (argument_count > 1)
{
	b_gui_widget_set_position(bGuiContextMenu, argument[1], argument[2]);
}
else
{
	b_gui_widget_set_position(bGuiContextMenu, bGuiWindowMouseX, bGuiWindowMouseY);
}
b_gui_add_item(bGuiRoot, bGuiContextMenu);
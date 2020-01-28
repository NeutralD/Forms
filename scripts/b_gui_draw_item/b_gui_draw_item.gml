/// @func b_gui_draw_item(item[, x, y])
/// @desc Draws the item.
/// @param {real} item The id of the item.
/// @param {real} [x] The x position to draw the item at.
/// @param {real} [y] The y position to draw the item at.
var _item = argument[0];

// Set position if passed
if (argument_count == 3)
{
	b_gui_widget_set_position(_item, argument[1], argument[2]);
}

// Update
var _scrUpdate = _item[? "scrUpdate"];
if (_scrUpdate != noone)
{
	script_execute(_scrUpdate, _item);
}

// Draw
var _scrDraw = _item[? "scrDraw"];
if (_scrDraw != noone)
{
	script_execute(_scrDraw, _item);
}
b_gui_widget_set_redraw(_item, false);
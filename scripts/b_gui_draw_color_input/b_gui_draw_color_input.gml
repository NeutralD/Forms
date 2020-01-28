/// @func b_gui_draw_color_input(x, y, width, argb, colorPickerName)
/// @desc Draws a color input at the given position.
/// @param {real} x The x position to draw the input at.
/// @param {real} y The y position to draw the input at.
/// @param {real} width The width of the input.
/// @param {real} argb The current ARGB color.
/// @param {string} colorPickerName Name of a variable which holds id of a
/// color picker for this instance of a color input.
/// @return {real} The id of a color picker on click or noone.
var _container = bGuiWidgetFilling;
var _x = argument0;
var _y = argument1;
var _width = argument2;
var _argb = argument3;
var _colorPickerName = argument4;
var _colorPicker = variable_instance_get(id, _colorPickerName);
var _mouseOver = b_gui_mouse_over(_x, _y, _width, bGuiInputSpriteHeight);
var _color = ce_color_from_argb(_argb);
var _alpha = ce_color_argb_to_alpha(_argb);

draw_sprite_ext(B_SprGuiInput, 0, _x, _y, 1, 1, 0, _color, 1);
var _w = round((_width - bGuiInputSpriteWidth * 2) * 0.5);
draw_sprite_stretched_ext(B_SprGuiInput, 1, _x + bGuiInputSpriteWidth, _y,
	_w, bGuiInputSpriteHeight, _color, 1);
draw_sprite_stretched_ext(B_SprGuiInput, 1, _x + bGuiInputSpriteWidth + _w, _y,
	_w, bGuiInputSpriteHeight, c_black, 1);
draw_sprite_stretched_ext(B_SprGuiInput, 1, _x + bGuiInputSpriteWidth + _w, _y,
	_w, bGuiInputSpriteHeight, c_white, _alpha);
draw_sprite_ext(B_SprGuiInput, 2, _x + bGuiInputSpriteWidth + _w * 2, _y,
	1, 1, 0, c_black, 1);
draw_sprite_ext(B_SprGuiInput, 2, _x + bGuiInputSpriteWidth + _w * 2, _y,
	1, 1, 0, c_white, _alpha);

if (_colorPicker == noone)
{
	if (_mouseOver && mouse_check_button_pressed(mb_left))
	{
		_colorPicker = b_gui_window_create("Color Picker");
		_colorPicker[? "reference"] = _colorPickerName;
		b_gui_widget_set_position(_colorPicker,
			round((bGuiWindowWidth - b_gui_widget_get_width(_colorPicker)) * 0.5),
			round((bGuiWindowHeight - b_gui_widget_get_height(_colorPicker)) * 0.5));
		var _colorPickerContainer = b_gui_window_get_container(_colorPicker);
		_colorPickerContainer[? "color"] = _color;
		_colorPickerContainer[? "alpha"] = _alpha;
		_colorPickerContainer[? "redrawContainer"] = _container;
		b_gui_window_set_content(_colorPicker, b_gui_cnt_color_picker);
		b_gui_add_item(bGuiRoot, _colorPicker);
		variable_instance_set(id, _colorPickerName, _colorPicker);
	}
}
else
{
	var _colorPickerContainer = b_gui_window_get_container(_colorPicker);
	var _pickerColor = _colorPickerContainer[? "color"];
	var _pickerAlpha = _colorPickerContainer[? "alpha"];
	var _pickerArgb = ce_color_alpha_to_rgb(_pickerColor, _pickerAlpha);

	if (_argb != _pickerArgb)
	{
		show_debug_message(current_time);
		show_debug_message("Color changed!");
		show_debug_message([_argb, _pickerArgb]);
		return _pickerArgb;
	}
}

return undefined;
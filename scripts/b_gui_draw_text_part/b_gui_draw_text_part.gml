/// @func b_gui_draw_text_part(x, y, text, maxWidth[, color])
/// @desc Draws part of the text at the given position.
/// @param {real} x The x position to draw the text at.
/// @param {real} y The y position to draw the text at.
/// @param {string} text The text to draw.
/// @param {real} maxWidth The maximum width of the text in pixels. If the text
/// is longer than this, then it is clipped and
/// followed by "...".
/// @param {real} [color] The color of the text. If not provided,
/// `B_EGuiColor.Text` is used.
var _color = (argument_count > 4) ? argument[4] : B_EGuiColor.Text;
var _maxCharCount = floor(argument[3] / bGuiFontWidth);
if (string_length(argument[2]) > _maxCharCount)
{
	draw_text_color(argument[0], argument[1],
		string_copy(argument[2], 1, _maxCharCount - 3)
			+ string_repeat(".", min(3, _maxCharCount)),
		_color, _color, _color, _color, 1);
}
else
{
	draw_text_color(argument[0], argument[1], argument[2],
		_color, _color, _color, _color, 1);
}
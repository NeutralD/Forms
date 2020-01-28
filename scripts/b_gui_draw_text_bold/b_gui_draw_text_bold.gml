/// @func b_gui_draw_text_bold(x, y, text)
/// @desc Draws bold text at the given position.
/// @param {real} x The x position to draw the text at.
/// @param {real} y The y position to draw the text at.
/// @param {string} text The text to draw.
/// @note The sets the font to bold and resets it back to normal
/// right after rendering the text.
gml_pragma("forceinline");
var _fnt = draw_get_font();
draw_set_font(B_FntGuiBold);
draw_text(argument0, argument1, argument2);
draw_set_font(_fnt);
/// @func b_gui_draw_text_shadow(x, y, text, colorText, colorShadow)
/// @desc Draws text with shadow at the given position.
/// @param {real} x The x position to draw the text at.
/// @param {real} y The y position to draw the text at.
/// @param {string} text The text to draw.
/// @param {real} colorText The color of the text.
/// @param {real} colorShadow The color of the shadow.
gml_pragma("forceinline");
draw_text_color(argument0 + 1, argument1 + 1, argument2, argument4, argument4, argument4, argument4, 1);
draw_text_color(argument0, argument1, argument2, argument3, argument3, argument3, argument3, 1);
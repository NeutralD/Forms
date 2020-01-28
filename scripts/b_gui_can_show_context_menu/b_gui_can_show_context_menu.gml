/// @func b_gui_can_show_context_menu()
/// @desc Gets whether the context menu can be opened.
/// @return {real} True if the context menu can be opened.
gml_pragma("forceinline");
return (bGuiWindowMouseX == bGuiMousePressX
	&& bGuiWindowMouseY == bGuiMousePressY
	&& !keyboard_check(vk_alt));
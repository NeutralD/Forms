/// @func b_gui_init()
/// @desc Initializes GUI.
/// @return {real} The id of the GUI root widget.
display_set_gui_maximise();
bGuiWindowWidth = window_get_width();
bGuiWindowHeight = window_get_height();
bGuiWindowMouseX = window_mouse_get_x();
bGuiWindowMouseY = window_mouse_get_y();

var _fnt = draw_get_font();
draw_set_font(B_FntGuiNormal);
bGuiFontHeight = string_height("Q");
bGuiFontWidth = string_width("Q");
draw_set_font(_fnt);
bGuiLineHeight = sprite_get_height(B_SprGuiInput);

bGuiCursor = cr_default;
bGuiWidgets = ds_list_create();
bGuiWidgetId = 0;
bGuiWidgetHovered = noone;
bGuiWidgetActive = noone;
bGuiWidgetFilling = noone;
bGuiWidgetSelected = noone;
bGuiMouseX = 0;
bGuiMouseY = 0;
bGuiTooltip = "";
bGuiMatrixStack = ds_stack_create();
bGuiDestroyStack = ds_stack_create();
bGuiColorShow = -1;

// Input
bGuiInputSprite = B_SprGuiInput;
bGuiInputSpriteWidth = sprite_get_width(bGuiInputSprite);
bGuiInputSpriteHeight = sprite_get_height(bGuiInputSprite);
bGuiInputString = "";
bGuiInputIndex = [1, 1];
bGuiInputDrawIndexStart = 1;
bGuiInputMultitype = 0;
bGuiInputTimer = current_time;
bGuiInputActive = noone;

// Context menu
bGuiContextMenu = noone;
bGuiMousePressX = noone;
bGuiMousePressY = noone;

// Keyboard shortcuts
bGuiKeyLog = ds_list_create();

// Inputs
bGuiKsInputCut = b_gui_keyboard_shortcut_create(b_gui_input_cut);
b_gui_keyboard_shortcut_add_key(bGuiKsInputCut, vk_control);
b_gui_keyboard_shortcut_add_key(bGuiKsInputCut, ord("W"));

bGuiKsInputCopy = b_gui_keyboard_shortcut_create(b_gui_input_copy);
b_gui_keyboard_shortcut_add_key(bGuiKsInputCopy, vk_control);
b_gui_keyboard_shortcut_add_key(bGuiKsInputCopy, ord("C"));

bGuiKsInputPaste = b_gui_keyboard_shortcut_create(b_gui_input_paste);
b_gui_keyboard_shortcut_add_key(bGuiKsInputPaste, vk_control);
b_gui_keyboard_shortcut_add_key(bGuiKsInputPaste, ord("V"));

bGuiKsInputDelete = b_gui_keyboard_shortcut_create(b_gui_input_delete);
b_gui_keyboard_shortcut_add_key(bGuiKsInputDelete, vk_control);
b_gui_keyboard_shortcut_add_key(bGuiKsInputDelete, ord("D"));

bGuiKsInputSelectAll = b_gui_keyboard_shortcut_create(b_gui_input_select_all);
b_gui_keyboard_shortcut_add_key(bGuiKsInputSelectAll, vk_control);
b_gui_keyboard_shortcut_add_key(bGuiKsInputSelectAll, ord("A"));

// Root
bGuiRoot = b_gui_widgetset_create();
return bGuiRoot;
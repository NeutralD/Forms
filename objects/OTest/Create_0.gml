application_surface_enable(true);
application_surface_draw_enable(false);

var _root = b_gui_init();

var _menuBar = b_gui_menu_bar_create();
b_gui_add_item(_root, _menuBar);
_menuBar[? "width"] = bGuiWindowWidth; // TODO: Automatical widget sizing
_menuBar[? "height"] = bGuiLineHeight;

var _menuBarItem;
_menuBarItem = b_gui_menu_bar_item_create("File", context_menu_file);
b_gui_menu_bar_add_item(_menuBar, _menuBarItem);

_menuBarItem = b_gui_menu_bar_item_create("Help", context_menu_help);
b_gui_menu_bar_add_item(_menuBar, _menuBarItem);
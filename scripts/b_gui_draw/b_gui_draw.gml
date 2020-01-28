/// @func b_gui_draw()
/// @desc Draws GUI.
var _fnt = draw_get_font();
var _color = draw_get_color();

bGuiColorShow = -1;

draw_clear(B_EGuiColor.Background);
draw_set_font(B_FntGuiNormal);
draw_set_color(c_white);

// Draw items
var _items = b_gui_widgetset_get_items(bGuiRoot);
var _itemCount/*:int*/= ds_list_size(_items);

for (var i/*:int*/= 0; i < _itemCount; ++i)
{
	var _item = _items[| i];
	if (b_gui_widget_exists(_item))
	{
		b_gui_draw_item(_item);
	}
	else
	{
		ds_list_delete(_items, --i);
	}
}

// Draw debug
//b_gui_draw_text_shadow(bGuiWindowMouseX + 16, bGuiWindowMouseY + 64,
//	"hoveredShape = " + string(bGuiWidgetHovered)
//	+ "#activeShape = " + string(bGuiWidgetActive)
//	+ "#mousePos = " + string([bGuiMouseX, bGuiMouseY]),
//	c_yellow, c_black);

// Set cursor
if (bGuiWindowMouseX > 2
	&& bGuiWindowMouseY > 2
	&& bGuiWindowMouseX < window_get_width() - 2
	&& bGuiWindowMouseY < window_get_height() - 2)
{
	window_set_cursor(bGuiCursor);
}
bGuiCursor = cr_default;

// Handle destroy requests
while (!ds_stack_empty(bGuiDestroyStack))
{
	var _widget = ds_stack_pop(bGuiDestroyStack);
	if (b_gui_widget_exists(_widget))
	{
		script_execute(_widget[? "scrCleanUp"], _widget);
		if (bGuiWidgetActive == _widget)
		{
			bGuiWidgetActive = noone;
		}
	}
}

draw_set_color(_color);
draw_set_font(_fnt);
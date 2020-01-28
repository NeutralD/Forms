/// @func b_gui_widget_update(widget)
/// @desc Updates the widget.
/// @param {real} widget The id of the widget.
var _widget = argument0;

//b_gui_widget_set_size(_widget, b_gui_widget_get_width(_widget), b_gui_widget_get_height(_widget));

if (b_gui_widget_is_hovered(_widget))
{
	// Set tooltip on mouse over
	bGuiTooltip = b_gui_widget_get_tooltip(_widget);

	// Select widget
	if (mouse_check_button_pressed(mb_any))
	{
		var _exists = b_gui_widget_exists(bGuiWidgetSelected);
		if ((_exists && bGuiWidgetSelected != _widget)
			|| !_exists)
		{
			b_gui_request_redraw_all(bGuiRoot);
		}
		bGuiWidgetSelected = _widget;
	}
}
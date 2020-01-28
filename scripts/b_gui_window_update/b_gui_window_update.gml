/// @func b_gui_window_update(window)
/// @desc Updates the window.
/// @param {real} window The id of the window.
var _window = argument0;
var _width = b_gui_widget_get_width(_window);
var _height = b_gui_widget_get_height(_window);
var _border = _window[? "border"];
var _titleBar = b_gui_window_get_title_bar(_window);
var _resize = _window[? "resize"];

b_gui_widgetset_update(_window);

if (mouse_check_button_pressed(mb_any)
	&& (b_gui_widget_is_hovered(_window)
	|| b_gui_widget_delegates_recursive(_window, bGuiWidgetHovered)))
{
	b_gui_move_item_to_top(_window);

	////////////////////////////////////////////////////////////////////////////
	// FIXME Stupid hack :(
	bGuiWidgetSelected = _window;
	b_gui_request_redraw_all(bGuiRoot);
	////////////////////////////////////////////////////////////////////////////
}

var _titleBarHoveredForResize = (b_gui_widget_is_hovered(_titleBar)
	&& bGuiMouseY < _border);

if (b_gui_widget_is_hovered(_titleBar)
	&& !_titleBarHoveredForResize)
{
	// Start dragging
	if (mouse_check_button_pressed(mb_left)
		&& bGuiMouseX < _width - bGuiLineHeight - _border)
	{
		_window[? "drag"] = true;
		_window[? "mouseOffsetX"] = b_gui_widget_get_x(_window) - bGuiWindowMouseX;
		_window[? "mouseOffsetY"] = b_gui_widget_get_y(_window) - bGuiWindowMouseY;
		bGuiWidgetActive = _window;
	}
}
else if (_resize == B_EGuiResize.None
	&& _window[? "resizable"]
	&& (b_gui_widget_is_hovered(_window)
	|| _titleBarHoveredForResize))
{
	// Start resizing
	if (bGuiMouseX < _border)
	{
		_resize |= B_EGuiResize.Left;
	}
	else if (bGuiMouseX > _width - _border)
	{
		_resize |= B_EGuiResize.Right;
	}

	if (bGuiMouseY < _border)
	{
		_resize |= B_EGuiResize.Top;
	}
	else if (bGuiMouseY > _height - _border)
	{
		_resize |= B_EGuiResize.Bottom;
	}

	if (mouse_check_button_pressed(mb_left))
	{
		if (_resize & B_EGuiResize.Left)
		{
			_window[? "mouseOffsetX"] = bGuiWindowMouseX - b_gui_widget_get_x(_window);
		}
		else if (_resize & B_EGuiResize.Right)
		{
			_window[? "mouseOffsetX"] = b_gui_widget_get_x(_window) + b_gui_widget_get_width(_window) - bGuiWindowMouseX;
		}

		if (_resize & B_EGuiResize.Top)
		{
			_window[? "mouseOffsetY"] = bGuiWindowMouseY - b_gui_widget_get_y(_window);
		}
		else if (_resize & B_EGuiResize.Bottom)
		{
			_window[? "mouseOffsetY"] = b_gui_widget_get_y(_window) + b_gui_widget_get_height(_window) - bGuiWindowMouseY;
		}

		_window[? "resize"] = _resize;
		bGuiWidgetActive = _window;
	}
}

if (_window[? "drag"])
{
	////////////////////////////////////////////////////////////////////////////
	// Dragging
	b_gui_widget_set_position(_window,
		clamp(bGuiWindowMouseX, 0, bGuiWindowWidth) + _window[? "mouseOffsetX"],
		clamp(bGuiWindowMouseY, 0, bGuiWindowHeight) + _window[? "mouseOffsetY"]);
	if (!mouse_check_button(mb_left))
	{
		_window[? "drag"] = false;
		bGuiWidgetActive = noone;
	}
}

if (_resize != B_EGuiResize.None)
{
	////////////////////////////////////////////////////////////////////////////
	// Resizing

	// Set cursor
	if ((_resize & B_EGuiResize.Left
		&& _resize & B_EGuiResize.Top)
		|| (_resize & B_EGuiResize.Right
		&& _resize & B_EGuiResize.Bottom))
	{
		bGuiCursor = cr_size_nwse;
	}
	else if ((_resize & B_EGuiResize.Left
		&& _resize & B_EGuiResize.Bottom)
		|| (_resize & B_EGuiResize.Right
		&& _resize & B_EGuiResize.Top))
	{
		bGuiCursor = cr_size_nesw;
	}
	else if (_resize & B_EGuiResize.Horizontal)
	{
		bGuiCursor = cr_size_we;
	}
	else if (_resize & B_EGuiResize.Vertical)
	{
		bGuiCursor = cr_size_ns;
	}

	// Set size
	if (bGuiWidgetActive == _window)
	{
		var _minWidth = 128 + _border * 2;
		if (_resize & B_EGuiResize.Right)
		{
			b_gui_widget_set_width(_window, max(bGuiMouseX + _window[? "mouseOffsetX"], _minWidth));
		}
		else if (_resize & B_EGuiResize.Left)
		{
			var _widthOld = b_gui_widget_get_width(_window);
			var _widthNew = max(_widthOld - bGuiMouseX + _window[? "mouseOffsetX"], _minWidth);
			b_gui_widget_set_width(_window, _widthNew);
			b_gui_widget_set_x(_window, b_gui_widget_get_x(_window) - (_widthNew - _widthOld));
		}

		var _minHeight = b_gui_widget_get_height(_titleBar) + _border * 2;
		if (_resize & B_EGuiResize.Bottom)
		{
			b_gui_widget_set_height(_window, max(bGuiMouseY + _window[? "mouseOffsetY"], _minHeight));
		}
		else if (_resize & B_EGuiResize.Top)
		{
			var _heightOld = b_gui_widget_get_height(_window);
			var _heightNew = max(_heightOld - bGuiMouseY + _window[? "mouseOffsetY"], _minHeight)
			b_gui_widget_set_height(_window, _heightNew);
			b_gui_widget_set_y(_window, b_gui_widget_get_y(_window) - (_heightNew - _heightOld));
		}

		if (!mouse_check_button(mb_left))
		{
			_window[? "resize"] = B_EGuiResize.None;
			bGuiWidgetActive = noone;
		}
	}
}
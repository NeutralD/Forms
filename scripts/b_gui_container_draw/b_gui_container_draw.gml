/// @func b_gui_container_draw(container)
/// @desc Draws the container.
/// @param {real} container The id of the container.
// Draw items
if (b_gui_begin_fill(argument0))
{
	var _size = [0.1, 0.1];
	var _content = argument0[? "content"];
	if (_content != noone)
	{
		_size = script_execute(_content, argument0);
	}

	b_gui_container_set_content_width(argument0, _size[0]);
	b_gui_container_set_content_height(argument0, _size[1]);
	b_gui_end_fill(argument0);
}

// Draw container
b_gui_canvas_draw(argument0);
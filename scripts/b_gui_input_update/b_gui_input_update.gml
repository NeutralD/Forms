/// @func b_gui_input_update(input)
/// @param {real} input The id of the input.
var _input = argument0;

var _delegate = b_gui_decode_id(_input);
b_gui_request_redraw(_delegate);

var _inputStringLength = string_length(bGuiInputString);

// Multitype
bGuiInputMultitype = false;

if (keyboard_check_pressed(vk_anykey))
{
	bGuiInputMultitype = true;
	bGuiInputTimer = current_time;
}

if (current_time > bGuiInputTimer + 300)
{
	bGuiInputMultitype = true;
}

// Type
var _keyboardStringLength = string_length(keyboard_string);

if (_keyboardStringLength > 0)
{
	// Delete selected part
	if (bGuiInputIndex[0] != bGuiInputIndex[1])
	{
		b_gui_input_delete_selected();
	}

	// Insert string
	bGuiInputString = string_insert(keyboard_string, bGuiInputString, bGuiInputIndex[0]);
	bGuiInputIndex[0] += _keyboardStringLength;
	bGuiInputIndex[1] = bGuiInputIndex[0];
	keyboard_string = "";
}

// Backspace
if (keyboard_check(vk_backspace) && bGuiInputMultitype)
{
	if (bGuiInputIndex[0] == bGuiInputIndex[1])
	{
		bGuiInputString = string_delete(bGuiInputString, bGuiInputIndex[0] - 1, 1);
		bGuiInputIndex[0] = max(bGuiInputIndex[0] - 1, 1);
		bGuiInputIndex[1] = bGuiInputIndex[0];
	}
	else
	{
		b_gui_input_delete_selected();
	}
}
else if (keyboard_check(vk_delete) && bGuiInputMultitype)
{
	// Delete
	if (bGuiInputIndex[0] != bGuiInputIndex[1])
	{
		b_gui_input_delete_selected();
	}
	else
	{
		bGuiInputString = string_delete(bGuiInputString, bGuiInputIndex[0], 1);
	}
}

// Save string length
var _inputStringLength = string_length(bGuiInputString);

// Control
if (keyboard_check(vk_control))
{
	if (keyboard_check_pressed(ord("A")))
	{
		b_gui_input_select_all();
	}
	else if (keyboard_check_pressed(ord("D")))
	{
		b_gui_input_delete();
	}
	else if (keyboard_check_pressed(ord("X")))
	{
		b_gui_input_cut();
	}
	else if (keyboard_check_pressed(ord("C")))
	{
		b_gui_input_copy();
	}
	else if (keyboard_check_pressed(ord("V")))
	{
		b_gui_input_paste();
		_inputStringLength = string_length(bGuiInputString);
	}
}

// Arrows
if (keyboard_check(vk_left) && bGuiInputMultitype)
{
	bGuiInputIndex[1] = max(bGuiInputIndex[1] - 1, 1);

	if (!keyboard_check(vk_shift))
	{
		bGuiInputIndex[0] = bGuiInputIndex[1];
	}
}
else if (keyboard_check(vk_right) && bGuiInputMultitype)
{
	bGuiInputIndex[1] = min(bGuiInputIndex[1] + 1, _inputStringLength + 1);

	if (!keyboard_check(vk_shift))
	{
		bGuiInputIndex[0] = bGuiInputIndex[1];
	}
}

// Home/end
if (keyboard_check_pressed(vk_home))
{
	bGuiInputIndex[1] = 1;

	if (!keyboard_check(vk_shift))
	{
		bGuiInputIndex[0] = bGuiInputIndex[1];
	}
}
else if (keyboard_check_pressed(vk_end))
{
	bGuiInputIndex[1] = _inputStringLength + 1;

	if (!keyboard_check(vk_shift))
	{
		bGuiInputIndex[0] = bGuiInputIndex[1];
	}
}
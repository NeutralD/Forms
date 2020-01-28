/// @func b_gui_question_create(title, text, buttons)
/// @param {string} title The question title.
/// @param {string} text The question text.
/// @param {array} buttons Array of buttons in form `[[text, action], ...]`.
/// @return {real} The id of the created question widget.
var _question = b_gui_window_create(argument[0]);
b_gui_window_set_content(_question, b_gui_cnt_question);
_question[? "text"] = argument[1];
_question[? "buttons"] = argument[2];
_question[? "closeable"] = false;

gpu_push_state();
gpu_set_colorwriteenable(false, false, false, false);
var _contentSize = b_gui_cnt_question(b_gui_window_get_container(_question));
gpu_pop_state();

var _border = _question[? "border"];
var _width = _contentSize[0] + _border * 2;
var _height = _contentSize[1]
	+ b_gui_widget_get_height(b_gui_window_get_title_bar(_question))
	+ _border * 3;

b_gui_widget_set_rectangle(
	_question,
	round((window_get_width() - _width) * 0.5),
	round((window_get_height() - _height) * 0.5),
	_width,
	_height);

return _question;
//// @func b_gui_alert_create(title, text[, okAction[, cancelAction]])
/// @param {string} title The alert title.
/// @param {string} text The alert text.
/// @param {real} [okAction] The script executed when the alert is closed with
/// an "ok" button. Use noone for no action. Defaults to noone.
/// @param {real} [cancelAction] The script executed when the alert is closed with
/// a "cancel" button. Use noone for no action. Defaults to noone.
/// @return {real} The id of the created alert.
var _alert = b_gui_question_create(argument[0], argument[1], [
	[
		"Ok", (argument_count > 2) ? argument[2] : noone,
	],
	[
		"Cancel", (argument_count > 3) ? argument[3] : noone,
	]
]);
_alert[? "resizable"] = false;
_alert[? "closeable"] = false;
return _alert;
/// @func b_gui_matrix_push(x, y)
/// @desc Stores the current matrix into the matrix stack
/// and then pushes the coordinate system by the
/// given values.
/// @param {real} x The value to push the coordinate system by on the x axis.
/// @param {real} y The value to push the coordinate system by on the y axis.
var _matWorld = matrix_get(matrix_world);
ds_stack_push(bGuiMatrixStack, _matWorld);
matrix_set(matrix_world,
	matrix_multiply(_matWorld, matrix_build(argument0, argument1, 0, 0, 0, 0, 1, 1, 1)));
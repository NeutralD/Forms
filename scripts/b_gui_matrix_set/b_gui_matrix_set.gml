/// @func b_gui_matrix_set(x, y)
/// @desc Stores the current matrix into the matrix stack
/// and sets the origin of the coordinate system to
/// the given values.
/// @param {real} x The origin on the x axis.
/// @param {real} y The origin on the y axis.
var _matWorld = matrix_get(matrix_world);
ds_stack_push(bGuiMatrixStack, _matWorld);
matrix_set(matrix_world, matrix_build(argument0, argument1, 0, 0, 0, 0, 1, 1, 1));
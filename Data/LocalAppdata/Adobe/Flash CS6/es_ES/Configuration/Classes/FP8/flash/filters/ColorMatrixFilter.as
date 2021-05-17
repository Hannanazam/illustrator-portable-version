//****************************************************************************
// ActionScript Standard Library
// flash.filters.ColorMatrixFilter object
//****************************************************************************

intrinsic class flash.filters.ColorMatrixFilter extends flash.filters.BitmapFilter
{
	var matrix:Array;

	public function ColorMatrixFilter(matrix:Array);
	public function clone():ColorMatrixFilter;
}
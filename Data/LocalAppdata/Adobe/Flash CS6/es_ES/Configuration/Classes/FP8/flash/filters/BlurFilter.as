//****************************************************************************
// ActionScript Standard Library
// flash.filters.BlurFilter object
//****************************************************************************

intrinsic class flash.filters.BlurFilter extends flash.filters.BitmapFilter
{
	var blurX:Number;
	var blurY:Number;
	var quality:Number;

	public function BlurFilter(blurX:Number, blurY:Number, quality:Number);
	public function clone():BlurFilter;
}
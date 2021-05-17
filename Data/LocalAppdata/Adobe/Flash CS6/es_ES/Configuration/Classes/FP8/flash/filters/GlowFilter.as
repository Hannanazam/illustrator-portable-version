//****************************************************************************
// ActionScript Standard Library
// flash.filters.GlowFilter object
//****************************************************************************

intrinsic class flash.filters.GlowFilter extends flash.filters.BitmapFilter
{
	var color:Number;
	var alpha:Number;
	var blurX:Number;
	var blurY:Number;
	var strength:Number;
	var quality:Number;
	var inner:Boolean;
	var knockout:Boolean;

	public function GlowFilter(color:Number,
							   alpha:Number,
							   blurX:Number,
							   blurY:Number,
							   strength:Number,
							   quality:Number,
							   inner:Boolean,
							   knockout:Boolean);
	public function clone():GlowFilter;
}
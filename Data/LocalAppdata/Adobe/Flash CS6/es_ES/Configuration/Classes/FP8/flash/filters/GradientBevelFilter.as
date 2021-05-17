//****************************************************************************
// ActionScript Standard Library
// flash.filters.GradientBevelFilter object
//****************************************************************************

intrinsic class flash.filters.GradientBevelFilter extends flash.filters.BitmapFilter
{
	var distance:Number;
	var angle:Number; // in degrees
	var colors:Array;
	var alphas:Array;
	var ratios:Array;
	var blurX:Number;
	var blurY:Number;
	var strength:Number;
	var quality:Number;
	var type:String;
	var knockout:Boolean;

	public function GradientBevelFilter(distance:Number,
									   angle:Number,
									   colors:Array,
									   alphas:Array,
									   ratios:Array,
									   blurX:Number,
									   blurY:Number,
									   strength:Number,
									   quality:Number,
									   type:String,
									   knockout:Boolean);
	public function clone():GradientBevelFilter;
}
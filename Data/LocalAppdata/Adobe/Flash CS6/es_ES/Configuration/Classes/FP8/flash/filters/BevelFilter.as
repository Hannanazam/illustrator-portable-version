//****************************************************************************
// ActionScript Standard Library
// flash.filters.BevelFilter object
//****************************************************************************

intrinsic class flash.filters.BevelFilter extends flash.filters.BitmapFilter
{
	var distance:Number;
	var angle:Number;
	var highlightColor:Number;
	var highlightAlpha:Number;
	var shadowColor:Number;
	var shadowAlpha:Number;
	var blurX:Number;
	var blurY:Number;
	var knockout:Boolean;
	var quality:Number;
	var strength:Number;
	var type:String;

	public function BevelFilter(distance:Number,
								angle:Number,
								highlightColor:Number,
								highlightAlpha:Number, 
								shadowColor:Number,
								shadowAlpha:Number,
								blurX:Number,
								blurY:Number,
								strength:Number,
								quality:Number,
								type:String,
								knockout:Boolean);
	public function clone():BevelFilter;
}
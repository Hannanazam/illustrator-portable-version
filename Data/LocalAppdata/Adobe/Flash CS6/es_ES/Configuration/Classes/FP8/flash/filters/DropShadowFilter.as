//****************************************************************************
// ActionScript Standard Library
// flash.filters.DropShadowFilter object
//****************************************************************************

intrinsic class flash.filters.DropShadowFilter extends flash.filters.BitmapFilter
{
	var distance:Number;
	var angle:Number;
	var color:Number;
	var alpha:Number;
	var blurX:Number;
	var blurY:Number;
	var hideObject:Boolean;
	var inner:Boolean;
	var knockout:Boolean;
	var quality:Number;
	var strength:Number;

	public function DropShadowFilter(distance:Number,
									 angle:Number, 
									 color:Number,
									 alpha:Number,
									 blurX:Number,
									 blurY:Number,
									 strength:Number,
									 quality:Number,
									 inner:Boolean,
									 knockout:Boolean,
									 hideObject:Boolean);
	public function clone():DropShadowFilter;
}
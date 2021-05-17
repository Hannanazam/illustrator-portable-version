//****************************************************************************
// ActionScript Standard Library
// flash.geom.ColorTransform object
//****************************************************************************

intrinsic class flash.geom.ColorTransform
{
	var redMultiplier:Number;
	var greenMultiplier:Number;
	var blueMultiplier:Number;
	var alphaMultiplier:Number;
	var redOffset:Number;
	var greenOffset:Number;
	var blueOffset:Number;
	var alphaOffset:Number;
	var rgb:Number;

	public function ColorTransform(redMultiplier:Number, greenMultiplier:Number, blueMultiplier:Number, alphaMultiplier:Number, 
			redOffset:Number, greenOffset:Number, blueOffset:Number, alphaOffset:Number);
	public function concat (second:ColorTransform):Void;
	public function toString():String;
}
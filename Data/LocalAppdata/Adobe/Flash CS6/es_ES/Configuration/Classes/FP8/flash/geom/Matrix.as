//****************************************************************************
// ActionScript Standard Library
// flash.geom.Matrix object
//****************************************************************************
import flash.geom.Point;

intrinsic class flash.geom.Matrix
{
	var a:Number;
	var b:Number;
	var c:Number;
	var d:Number;
	var tx:Number;
	var ty:Number;

	public function Matrix(a:Number,  b:Number,
						   c:Number,  d:Number,
						   tx:Number, ty:Number);
	public function clone():Matrix;
	public function concat(m:Matrix):Void;
	public function invert():Void;
	public function identity():Void;
	public function createBox (scaleX:Number, scaleY:Number, rotation:Number, tx:Number, ty:Number):Void;
	public function createGradientBox (width:Number, height:Number, rotation:Number, tx:Number, ty:Number):Void;
	public function rotate(angle:Number):Void;
	public function translate(tx:Number, ty:Number):Void;
	public function scale(sx:Number, sy:Number):Void;
	public function deltaTransformPoint(pt:Point):Point;
	public function transformPoint(pt:Point):Point;
	public function toString():String;
}
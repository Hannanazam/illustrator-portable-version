//****************************************************************************
// ActionScript Standard Library
// flash.geom.Point object
//****************************************************************************

intrinsic class flash.geom.Point
{
	var x:Number;
	var y:Number;
	var length:Number;

	public static function interpolate(pt1:Point, pt2:Point, f:Number):Point;
	public static function distance(pt1:Point, pt2:Point):Number;
	public static function polar(len:Number, angle:Number):Point;

	public function Point(x:Number, y:Number);
	public function clone():Point;
	public function offset(dx:Number, dy:Number):Void;
	public function equals(toCompare:Object):Boolean;
	public function subtract(v:Point):Point;
	public function add(v:Point):Point;
	public function normalize(length:Number):Void;
	public function toString():String;
}
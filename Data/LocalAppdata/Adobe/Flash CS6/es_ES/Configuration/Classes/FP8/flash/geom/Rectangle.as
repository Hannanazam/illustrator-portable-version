//****************************************************************************
// ActionScript Standard Library
// flash.geom.Rectangle object
//****************************************************************************
import flash.geom.Point;

intrinsic class flash.geom.Rectangle
{
	var x:Number;
	var y:Number;
	var width:Number;
	var height:Number;
	var left:Number;
	var right:Number;
	var top:Number;
	var bottom:Number;
	var topLeft:Point;
	var bottomRight:Point;
	var size:Point;

	public function Rectangle(x:Number, y:Number,
							  width:Number, height:Number);
	public function clone():Rectangle;
	public function isEmpty():Boolean;
	public function setEmpty():Void;
	public function inflate(dx:Number, dy:Number):Void;
	public function inflatePoint(pt:Point):Void;
	public function offset(dx:Number, dy:Number):Void;
	public function offsetPoint(pt:Point):Void;
	public function contains(x:Number, y:Number):Boolean;
	public function containsPoint(pt:Point):Boolean;
	public function containsRectangle(rect:Rectangle):Boolean;
	public function intersection(toIntersect:Rectangle):Rectangle;
	public function intersects(toIntersect:Rectangle):Boolean;
	public function union(toUnion:Rectangle):Rectangle;
	public function equals(toCompare:Object):Boolean;
	public function toString():String;
}
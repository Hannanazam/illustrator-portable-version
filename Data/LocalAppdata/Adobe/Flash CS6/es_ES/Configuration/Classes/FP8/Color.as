//****************************************************************************
// ActionScript Standard Library
// Color transform object
//****************************************************************************

intrinsic class Color
{
	function Color(target:Object);

	function getRGB():Number;
	function getTransform():Object;
	function setRGB(offset:Number):Void;
	function setTransform(transformObject:Object):Void;
}
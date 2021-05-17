//****************************************************************************
// ActionScript Standard Library
// Number object
//****************************************************************************

intrinsic class Number
{
	static var MAX_VALUE:Number;
	static var MIN_VALUE:Number;
	static var NaN:Number;
	static var NEGATIVE_INFINITY:Number;
	static var POSITIVE_INFINITY:Number;

	function Number(num:Object);

	function toString(radix:Number):String;	
	function valueOf():Number;
}
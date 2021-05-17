//****************************************************************************
// ActionScript Standard Library
// Array object
//****************************************************************************

intrinsic dynamic class Array
{
	static var CASEINSENSITIVE:Number;
	static var DESCENDING:Number;
	static var NUMERIC:Number;
	static var RETURNINDEXEDARRAY:Number;
	static var UNIQUESORT:Number;

	var length:Number;

	function Array(value:Object);

	function concat(value:Object):Array;
	function join(delimiter:String):String;
	function pop():Object;
	function push(value):Number;
	function reverse():Void;
	function shift():Object;
	function slice(startIndex:Number, endIndex:Number):Array;
	function sort(compareFunction:Object, options: Number):Array; // 'compare' might be omitted so untyped. 'options' is optional.
	function sortOn(fieldName:Object, options: Object):Array; // 'fieldName' is a String, or an Array of String. 'options' is optional.
	function splice(startIndex:Number, deleteCount:Number, value:Object):Array;
	function toString():String;
	function unshift(value:Object):Number;
}
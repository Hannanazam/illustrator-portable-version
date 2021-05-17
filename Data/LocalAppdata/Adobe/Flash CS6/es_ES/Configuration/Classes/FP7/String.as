//****************************************************************************
// ActionScript Standard Library
// String object
//****************************************************************************

intrinsic class String
{
	var length:Number;

	function String(value:String);

	static function fromCharCode():String;

	function charAt(index:Number):String;
	function charCodeAt(index:Number):Number;
	function concat(value:Object):String;
	function endswith( endString:String ):Number; // Central API
	function indexOf(value:String, startIndex:Number):Number;
	function lastIndexOf(value:String, startIndex:Number):Number;
	function replace( re:String, repl:String ):String; // Central API
	function slice(start:Number,end:Number):String;
	function split(delimiter:String, limit:Number):Array;
	function substr(start:Number,length:Number):String;
	function substring(start:Number,end:Number):String;
	function toLowerCase():String;
	function toString():String;
	function toUpperCase():String;
	function valueOf():String;
}
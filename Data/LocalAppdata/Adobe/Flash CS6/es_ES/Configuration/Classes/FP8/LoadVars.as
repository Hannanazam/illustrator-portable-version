//****************************************************************************
// ActionScript Standard Library
// LoadVars object
//****************************************************************************

dynamic intrinsic class LoadVars
{
	var contentType:String;
	var loaded:Boolean;

	function LoadVars();

	function addRequestHeader(header:Object, headerValue:String):Void; // first param could be String or Array
	function decode(queryString:String):Void;
	function getBytesLoaded():Number;
	function getBytesTotal():Number;
	function load(url:String):Boolean;
	function send(url:String,target:String,method:String):Boolean;
	function sendAndLoad(url:String,target:Object,method:String):Boolean; // target not typed because it could be LoadVars or XML
	function toString():String;
	function onData(src:String):Void;
	function onLoad(success:Boolean):Void;
	function onHTTPStatus(httpStatus:Number):Void;
}
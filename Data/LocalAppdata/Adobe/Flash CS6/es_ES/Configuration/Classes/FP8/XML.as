//****************************************************************************
// ActionScript Standard Library
// XML Document Object Model
//****************************************************************************

intrinsic class XML extends XMLNode
{
	var contentType:String;
	var docTypeDecl:String;
	var ignoreWhite:Boolean;
	var loaded:Boolean;
	var status:Number;
	var xmlDecl:String;
	var idMap:Object;

	function XML(text:String);

	function addRequestHeader(header:Object, headerValue:String):Void;
	function createElement(name:String):XMLNode;
	function createTextNode(value:String):XMLNode;
	function getBytesLoaded():Number;
	function getBytesTotal():Number;
	function getRequestHeaders():Object; // Central API
	function getRequestHeader( key:String ):Object; // Central API
	function getResponseHeaders():Object; // Central API
	function getResponseHeader( key:String ):Object; // Central API
	function getResponseBody():Object; // Central API
	function load(url:String):Boolean;
	function parseXML(value:String):Void;
	function send(url:String,target:String,method:String):Boolean;
	function sendAndLoad(url:String, resultXML:XML):Void;
	 function onLoad(success:Boolean):Void;
	function onData(src:String):Void;
	function onHTTPStatus(httpStatus:Number):Void;
}
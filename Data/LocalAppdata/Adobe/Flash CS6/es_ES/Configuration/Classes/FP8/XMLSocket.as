//****************************************************************************
// ActionScript Standard Library
// XML Continuous Server Connection
//****************************************************************************

intrinsic class XMLSocket
{
	function XMLSocket();

	function close():Void;
	function connect(url:String,port:Number):Boolean;
	function send(data:Object):Void;
	function onClose():Void;
	function onConnect(success:Boolean):Void;
	function onData(src:String):Void;
	function onXML(src:XML):Void;
}
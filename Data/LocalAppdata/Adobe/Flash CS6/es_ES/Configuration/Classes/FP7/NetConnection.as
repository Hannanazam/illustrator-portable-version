//****************************************************************************
// ActionScript Standard Library
// NetConnection object
//****************************************************************************

dynamic intrinsic class NetConnection
{
	var isConnected:Boolean;
	var uri:String;

	function NetConnection();

	function addHeader();
	function call(remoteMethod:String, resultObject:Object):Void;
	function close():Void;
	function connect(targetURI:String):Boolean;
	function onResult(infoObject:Object):Void;	
	function onStatus(infoObject:Object):Void;
}
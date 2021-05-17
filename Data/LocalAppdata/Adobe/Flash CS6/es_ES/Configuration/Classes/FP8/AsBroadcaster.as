//****************************************************************************
// ActionScript Standard Library
// AsBroadcaster object
//****************************************************************************

intrinsic class AsBroadcaster {
	 var _listeners:Array;

	static function initialize(obj:Object):Void;

	function addListener(listenerObj:Object):Boolean;
	function broadcastMessage(eventName:String):Void;
	function removeListener(listenerObj:Object):Boolean;
}
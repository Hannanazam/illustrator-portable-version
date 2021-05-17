//****************************************************************************
// ActionScript Standard Library
// Video object
//****************************************************************************

intrinsic class Video
{
	var deblocking:Number;
	var height:Number;
	var smoothing:Boolean;
	var width:Number;

	function attachVideo(source:Object):Void;
	function clear():Void;

	// Mobile specific
	function play():Boolean;
	function close():Void;
	function stop():Void;
	function pause():Void;
	function resume():Void;
}
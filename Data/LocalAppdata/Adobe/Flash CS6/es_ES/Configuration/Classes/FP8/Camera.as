//****************************************************************************
// ActionScript Standard Library
// Camera object
//****************************************************************************

intrinsic class Camera
{
	static var names:Array;

	var activityLevel:Number;
	var bandwidth:Number;
	var currentFps:Number;
	var height:Number;
	var fps:Number;
	var index:Number;
	var keyFrameInterval:Number;
	var loopback:Boolean;
	var motionLevel:Number;
	var motionTimeOut:Number;
	var muted:Boolean;
	var name:String;
	var nativeModes:Array;
	var quality:Number;
	var width:Number;

	static function get(index:Number):Camera;

	function setKeyFrameInterval(keyFrameInterval:Number):Void;
	function setLoopback(compress:Boolean):Void;
	function setMode(width:Number,height:Number,fps:Number,favorArea:Boolean):Void;
	function setMotionLevel(motionLevel:Number,timeOut:Number):Void;
	function setQuality(bandwidth:Number,quality:Number):Void;
	function onActivity(active:Boolean):Void;
	function onStatus(infoObject:Object):Void;
}
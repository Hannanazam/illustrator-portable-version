//****************************************************************************
// ActionScript Standard Library
// Microphone object
//****************************************************************************

intrinsic class Microphone
{
	static var names:Array;

	var activityLevel:Number;
	var gain:Number;
	var index:Number;
	var muted:Boolean;
	var name:String;
	var rate:Number;
	var silenceLevel:Number;
	var silenceTimeOut:Number;
	var useEchoSuppression:Boolean;

	static function get(index:Number):Microphone;

	function setCodec(name:String):Void;
	function setEncodeQuality(quality:Number):Void;
	function setFramesPerPacket(fpp:Number):Void;
	function setGain(gain:Number):Void;
	function setRate(rate:Number):Void;
	function setSilenceLevel(silenceLevel:Number,timeOut:Number):Void;
	function setUseEchoSuppression(useEchoSuppression:Boolean):Void;
	function onActivity(active:Boolean):Void;
	function onStatus(infoObject:Object):Void;
}

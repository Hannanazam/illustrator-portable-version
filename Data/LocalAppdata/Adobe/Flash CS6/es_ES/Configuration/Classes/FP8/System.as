//****************************************************************************
// ActionScript Standard Library
// System object
//****************************************************************************

intrinsic class System
{
	static var exactSettings:Boolean;
	static var useCodepage:Boolean;

	static function setClipboard(text:String):Void;
	static function showSettings(tabID:Number):Void;
	static function onStatus(infoObject:Object):Void;
}
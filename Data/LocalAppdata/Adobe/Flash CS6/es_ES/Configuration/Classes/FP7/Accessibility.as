//****************************************************************************
// ActionScript Standard Library
// Accessibility object
//****************************************************************************

intrinsic class Accessibility {
	static function isActive():Boolean;
	static function sendEvent(mc:MovieClip, childID:Object, event:Object, isNonHtml:Boolean):Void;
	static function updateProperties():Void;
}
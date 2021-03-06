//****************************************************************************
// ActionScript Standard Library
// Selection control
//****************************************************************************

intrinsic class Selection
{
	static function addListener(listener:Object):Void;
	static function getBeginIndex():Number;
	static function getCaretIndex():Number;
	static function getEndIndex():Number;
	static function getFocus():String;
	static function removeListener(listener:Object):Boolean;
	static function setFocus(newFocus:Object):Boolean; // newFocus can be string path or Object itself
	static function setSelection(beginIndex:Number, endIndex:Number):Void;
}
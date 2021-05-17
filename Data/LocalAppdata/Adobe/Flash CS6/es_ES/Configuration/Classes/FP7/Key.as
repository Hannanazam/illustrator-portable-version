//****************************************************************************
// ActionScript Standard Library
// Key object
//****************************************************************************

intrinsic class Key
{
	static var _listeners:Array;
	static var ALT         :Number =   18;
	static var BACKSPACE   :Number =   8;
	static var CAPSLOCK    :Number =   20;
	static var CONTROL     :Number =   17;
	static var INSERT      :Number =   45;
	static var DELETEKEY   :Number =   46;
	static var DOWN        :Number =   40;
	static var END         :Number =   35;
	static var ENTER       :Number =   13;
	static var ESCAPE      :Number =   27;
	static var HOME        :Number =   36;
	static var LEFT        :Number =   37;
	static var PGDN        :Number =   34;
	static var PGUP        :Number =   33;
	static var RIGHT       :Number =   39;
	static var SHIFT       :Number =   16;
	static var SPACE       :Number =   32;
	static var TAB         :Number =   9;
	static var UP          :Number =   38;

	static function addListener(listener:Object):Void;
	static function getAscii():Number;
	static function getCode():Number;
	static function isDown(code:Number):Boolean;
	static function isToggled(code:Number):Boolean;
	static function removeListener(listener:Object):Boolean;

	// Mobile specific
	//static function getCode():String;
}
//****************************************************************************
// ActionScript Standard Library
// CustomActions object
//****************************************************************************

intrinsic class CustomActions
{
	static function install(name:String,data:String): Boolean;
	static function get(name:String):String;
	static function list():Array;
	static function uninstall(name:String): Boolean;
}
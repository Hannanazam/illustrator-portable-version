//****************************************************************************
// ActionScript Standard Library
// System.security controls
//****************************************************************************

intrinsic class System.security
{
	static function allowDomain(domain1:String):Void;
	static function allowInsecureDomain(domain:String):Void;
	static function loadPolicyFile(url:String):Void;
	static function escapeDomain(domain:String):String;
	static var sandboxType : String;
}
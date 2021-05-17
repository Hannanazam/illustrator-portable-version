//****************************************************************************
// ActionScript Standard Library
// ExternalInterface object
//****************************************************************************

intrinsic class flash.external.ExternalInterface
{
	static var available:Boolean; // read only

	static function addCallback(methodName:String, instance:Object, method:Function):Boolean;
	static function call(methodName:String, parameter1:Object):Object;
}
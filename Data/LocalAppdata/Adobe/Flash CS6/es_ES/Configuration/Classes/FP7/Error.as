//****************************************************************************
// ActionScript Standard Library
// Error object
//****************************************************************************

intrinsic class Error
{
	var message:String;
	var name:String;

	function Error(message:String);

	function toString():String;
}
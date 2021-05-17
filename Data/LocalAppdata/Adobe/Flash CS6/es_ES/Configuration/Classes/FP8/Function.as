//****************************************************************************
// ActionScript Standard Library
// Function object
//****************************************************************************

dynamic intrinsic class Function
{
	var prototype:Object;

	function apply(thisObject:Object,argArray:Array);
	function call(thisObject:Object, parameter1:Object);
	function toString():String;
}
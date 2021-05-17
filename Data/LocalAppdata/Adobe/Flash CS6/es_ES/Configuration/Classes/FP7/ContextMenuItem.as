//****************************************************************************
// ActionScript Standard Library
// ContextMenuItem object
//****************************************************************************

intrinsic dynamic class ContextMenuItem
{
	var caption:String;
	var enabled:Boolean;	
	var separatorBefore:Boolean;	
	var visible:Boolean;

	function ContextMenuItem(caption:String, 
			callbackFunction:Function, 
			separatorBefore:Boolean, 
			enabled:Boolean, 
			visible:Boolean);	

	function copy():ContextMenuItem;
	function onSelect(obj:Object, menuItem:Object):Void;
}
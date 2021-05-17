//****************************************************************************
// ActionScript Standard Library
// ContextMenu object
//****************************************************************************

intrinsic dynamic class ContextMenu
{
	var builtInItems:Object;	
	var customItems:Array;

	function ContextMenu(callbackFunction:Function);	

	function copy():ContextMenu;	
	function hideBuiltInItems():Void;	
	function onSelect(item:Object, item_menu:Object):Void;
}
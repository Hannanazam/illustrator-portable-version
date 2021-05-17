//****************************************************************************
// ActionScript Standard Library
// XML Document Object Model
//****************************************************************************

intrinsic class XMLNode
{
	var attributes:Object;
	var childNodes:Array;
	var firstChild:XMLNode;
	var lastChild:XMLNode;
	var nextSibling:XMLNode;
	var nodeName:String;
	var nodeType:Number;
	var nodeValue:String;
	var parentNode:XMLNode;
	var previousSibling:XMLNode;

	function appendChild(newChild:XMLNode):Void;
	function cloneNode(deep:Boolean):XMLNode;
	function hasChildNodes():Boolean;
	function insertBefore(newChild:XMLNode,insertPoint:XMLNode):Void
	function removeNode():Void;
	function toString():String;
}
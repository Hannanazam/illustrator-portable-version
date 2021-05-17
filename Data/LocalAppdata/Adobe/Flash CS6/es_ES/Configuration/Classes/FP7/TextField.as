//****************************************************************************
// ActionScript Standard Library
// TextField object
//****************************************************************************

dynamic intrinsic class TextField
{
	var _alpha:Number;
	var _height:Number;
	var _highquality:Number;
	var _name:String;
	var _parent:MovieClip;
	var _quality:String;
	var _rotation:Number;
	var _soundbuftime:Number;
	var _target:String;
	var _url:String;
	var _visible:Boolean;
	var _width:Number;
	var _x:Number;
	var _xmouse:Number;
	var _xscale:Number;
	var _y:Number;
	var _ymouse:Number;
	var _yscale:Number;
	var autoSize:Object;
	var background:Boolean;
	var backgroundColor:Number;
	var border:Boolean;
	var borderColor:Number;
	var bottomScroll:Number;
	var condenseWhite:Boolean;
	var embedFonts:Boolean;
	var hscroll:Number;
	var html:Boolean;
	var htmlText:String;
	var length:Number;
	var maxChars:Number;
	var maxhscroll:Number;
	var maxscroll:Number;
	 var menu:ContextMenu;
	var mouseWheelEnabled:Boolean;
	var multiline:Boolean;
	var password:Boolean;
	var restrict:String;
	var scroll:Number;
	var selectable:Boolean;
	var styleSheet:TextField.StyleSheet;
	var tabEnabled:Boolean;
	var tabIndex:Number;
	var text:String;
	var textColor:Number;
	var textHeight:Number;
	var textWidth:Number;
	var type:String;
	var variable:String;
	var wordWrap:Boolean;

	static function getFontList():Array;

	function addListener(listener:Object):Boolean;
	function getDepth():Number;
	function getNewTextFormat():TextFormat;
	function getTextFormat(beginIndex:Number,endIndex:Number):TextFormat;
	function removeListener(listener:Object):Boolean;
	function removeTextField():Void;
	function replaceSel(newText:String):Void;
	function replaceText(beginIndex:Number,endIndex:Number,newText:String):Void;
	function setNewTextFormat(tf:TextFormat):Void;
	function setTextFormat():Void; // arguments can either be indices or a TextFormat instance
	function onChanged(changedField:TextField):Void;
	function onKillFocus(newFocus:Object):Void;
	function onScroller(scrolledField:TextField):Void;
	function onSetFocus(oldFocus:Object):Void;
}
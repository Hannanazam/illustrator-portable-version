//****************************************************************************
// ActionScript Standard Library
// PrintJob object
//****************************************************************************

intrinsic class PrintJob
{
	var orientation:String;
	var pageHeight:Number;
	var pageWidth:Number;
	var paperHeight:Number;
	var paperWidth:Number;

	function PrintJob();

	function addPage(target:Object, printArea:Object, options:Object, frameNum:Number):Boolean;
	function send():Void;
	function start():Boolean;
}
//****************************************************************************
// ActionScript Standard Library
// FileReference object
//****************************************************************************

intrinsic class flash.net.FileReferenceList
{
	var fileList:Array;

	public function FileReferenceList();
	public function browse(typelist:Array):Boolean;
	function addListener(listener:Object):Void;
	function removeListener(listener:Object):Boolean;	
}
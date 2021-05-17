function behaviorAdd(symbolName, suppressConversionWarning)
{
	//called when a behavior is to be added - prior to the UI for the behavior
	var doc = fl.getDocumentDOM();
	var alreadyActionSymbol = false;

	if (doc.selection.length == 1) {
		var selectedObj = doc.selection[0];
		if (selectedObj.elementType == "instance") {
			if (selectedObj.instanceType == "symbol") {
				if ((selectedObj.symbolType == "movie clip") || (selectedObj.symbolType == "button")){
					alreadyActionSymbol = true;
				}
			} else if (selectedObj.instanceType == "compiled clip") {
				alreadyActionSymbol = true;
			}
		}
		if (!alreadyActionSymbol){
			if (suppressConversionWarning == "FALSE"){
				alert("The selection will be converted to a movie clip.");
			}
			doc.convertToSymbol("movie clip", symbolName,"center");
		}
	}
	
	return (true);
}

function behaviorRemove()
{
	//called when a behavior is deleted via the behaviors panel
}

function behaviorCancelAdd(origObjType)
{
	//called when the "behaviorAdd()" returns false
	var doc = fl.getDocumentDOM();
	if (doc.selection.length == 1) {
		var name = doc.selection[0].libraryItem.name;
		var type = doc.library.getItemType(name);
		//did we change type?
		if ((type != "component") && (type != origObjType)){
			//revert to previous object
			doc.breakApart();
			//delete item from lib
			doc.library.deleteItem(name);
		}
	}
}

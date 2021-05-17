/**********************************************************

ADOBE SYSTEMS INCORPORATED 
Copyright 2005-2010 Adobe Systems Incorporated 
All Rights Reserved 

NOTICE:  Adobe permits you to use, modify, and 
distribute this file in accordance with the terms
of the Adobe license agreement accompanying it.  
If you have received this file from a source 
other than Adobe, then your use, modification,
or distribution of it requires the prior 
written permission of Adobe. 

*********************************************************/

/**********************************************************
 
SaveAsFXG.jsx

DESCRIPTION

Creates art in a new document then saves the document as FXG.

**********************************************************/


var docRef = app.documents.add();
var groupItems = docRef.groupItems;
var groupRef = groupItems.add();
var pathItems = groupRef.pathItems;

// Create new drawing on artboard.
var pathRef1 = pathItems.add();
pathRef1.setEntirePath(new Array(
								new Array(52.37, 438.33),
								new Array(262.7, 395.03),
								new Array(262.7, 481.63),
								new Array(52.37, 438.33),
								new Array(262.7, 438.33)));
								
var pathRef2 = pathItems.add();
pathRef2.setEntirePath(new Array(
								new Array(306, 691.97),
								new Array(262.7, 481.63),
								new Array(349.3, 481.63),
								new Array(306, 691.97),
								new Array(306, 481.63)));
								
var pathRef3 = pathItems.add();
pathRef3.setEntirePath(new Array(
								new Array(559.63, 438.33),
								new Array(349.3, 481.63),
								new Array(349.3, 395.03),
								new Array(559.63, 438.33),
								new Array(349.3, 438.33)));
								
var pathRef4 = pathItems.add();
pathRef4.setEntirePath(new Array(
								new Array(306, 184.7),
								new Array(349.3, 395.03),
								new Array(262.7, 395.03),
								new Array(306, 184.7),
								new Array(306, 395.03)));
								
var pathRef5 = pathItems.add();
pathRef5.setEntirePath(new Array(
								new Array(262.7, 481.63),
								new Array(349.3, 395.03)));
								
var pathRef6 = pathItems.add();
pathRef6.setEntirePath(new Array(
								new Array(262.7, 395.03),
								new Array(349.3, 481.63)));
								
// Save the current document as MXML-G.
var destFolder = Folder.selectDialog('Select the folder to save the FXG file to:');
if (destFolder) {
	var destFile = new File(destFolder + '/SaveAsFXG');
	var fxgSaveOptions = new FXGSaveOptions();
	fxgSaveOptions.saveMultipleArtboards = false;
	fxgSaveOptions.filtersPolicy = FiltersPreservePolicy.KEEPFILTERSEDITABLE;
    fxgSaveOptions.version = FXGVersion.VERSION2PT0;
    fxgSaveOptions.blendsPolicy  = BlendsExpandPolicy.AUTOMATICALLYCONVERTBLENDS;
    fxgSaveOptions.includeUnusedSymbols = false;
    fxgSaveOptions.preserveEditingCapabilities = true;
    fxgSaveOptions.textPolicy = TextPreservePolicy.AUTOMATICALLYCONVERTTEXT;
    fxgSaveOptions.downsampleLinkedImages = false;
    fxgSaveOptions.GradientsPolicy = GradientsPreservePolicy.AUTOMATICALLYCONVERTGRADIENTS;
	docRef.saveAs (destFile,  fxgSaveOptions);
}	

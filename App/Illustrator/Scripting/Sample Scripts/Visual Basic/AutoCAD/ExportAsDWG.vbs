'*************************************************************
'
' ADOBE SYSTEMS INCORPORATED
' Copyright 2005-2010 Adobe Systems Incorporated
' All Rights Reserved

' NOTICE:  Adobe permits you to use, modify, and
' distribute this file in accordance with the terms
' of the Adobe license agreement accompanying it.
' If you have received this file from a source
' other than Adobe, then your use, modification,
' or distribution of it requires the prior
' written permission of Adobe.
'
'*************************************************************

' ExportAsDWG.vbs

' DESCRIPTION

' Creates a new document and exports it to AutoCAD DWG file.

' ************************************************************/

Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
Set docRef = appRef.Documents.Add
Set groupItems = docRef.GroupItems
Set groupRef = groupItems.Add
Set pathItems = groupRef.PathItems

' Create new drawing on artboard.
Set pathRef1 = pathItems.Add
pathRef1.SetEntirePath(Array(Array(52.37, 438.33),Array(262.7, 395.03),Array(262.7, 481.63),Array(52.37, 438.33),Array(262.7, 438.33)))
								
Set pathRef2 = pathItems.Add
pathRef2.SetEntirePath(Array(Array(306, 691.97),Array(262.7, 481.63),Array(349.3, 481.63),Array(306, 691.97),Array(306, 481.63)))
								
Set pathRef3 = pathItems.Add
pathRef3.SetEntirePath(Array(Array(559.63, 438.33),Array(349.3, 481.63),Array(349.3, 395.03),Array(559.63, 438.33),Array(349.3, 438.33)))
								
Set pathRef4 = pathItems.Add
pathRef4.SetEntirePath(Array(Array(306, 184.7),Array(349.3, 395.03),Array(262.7, 395.03),Array(306, 184.7),Array(306, 395.03)))		

' Add a new layer containing art

Set layerRef = docRef.Layers.Add
Set pathItems = layerRef.PathItems
						
Set pathRef5 = pathItems.Add
pathRef5.SetEntirePath(Array(Array(262.7, 481.63),Array(349.3, 395.03)))
								
Set pathRef6 = pathItems.Add
pathRef6.SetEntirePath(Array(Array(262.7, 395.03),Array(349.3, 481.63)))
							

' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen export folder.
' Export document to DWG file.
doJavaScript = "var destFolder = Folder.selectDialog(""Select the folder to export the AutoCAD DWG file to:""); if (destFolder) folderPath = destFolder.fsName;"
destFolder = appRef.DoJavaScript(doJavaScript)
If (fileSystemObject.FolderExists(destFolder)) Then
	destFile = destFolder + "\ExportAsDWG.dwg"
	Set exportAutoCADOptions = CreateObject("Illustrator.ExportOptionsAutoCAD")
	exportAutoCADOptions.ExportFileFormat = 1 'aiDWG
	exportAutoCADOptions.ExportOption = 1 ' aiMaximumEditability
	exportAutoCADOptions.version = 3 ' aiAutoCADRelease18
	docRef.Export destFile, 8, exportAutoCADOptions
End If
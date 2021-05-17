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

' SaveAsFXG.vbs

' DESCRIPTION

' Creates art in a new document then saves the document as FXG.

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

Set pathRef5 = pathItems.Add
pathRef5.SetEntirePath(Array(Array(262.7, 481.63),Array(349.3, 395.03)))
								
Set pathRef6 = pathItems.Add
pathRef6.SetEntirePath(Array(Array(262.7, 395.03),Array(349.3, 481.63)))
							
' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen export folder.
' Save document as FXG file.
doJavaScript = "var destFolder = Folder.selectDialog(""Select the folder to save the FXG file to:""); if (destFolder) folderPath = destFolder.fsName;"
destFolder = appRef.DoJavaScript(doJavaScript)
If (fileSystemObject.FolderExists(destFolder)) Then
	destFile = destFolder + "\SaveAsFXG"
	Set fxgSaveOptions = CreateObject("Illustrator.FXGSaveOptions")
	fxgSaveOptions.SaveMultipleArtboards = false
	fxgSaveOptions.FiltersPolicy = 3 ' aiKeepFiltersEditable
	fxgSaveOptions.Version = 2 'AiFXGVersion.aiVersion2Pt0
  fxgSaveOptions.BlendsPolicy  = 1 'AiBlendsExpandPolicy.aiAutomaticallyConvertBlends
  fxgSaveOptions.IncludeUnusedSymbols = false
  fxgSaveOptions.PreserveEditingCapabilities = true
  fxgSaveOptions.TextPolicy = 4 'AiTextPreservePolicy.aiAutomaticallyConvertText
  fxgSaveOptions.DownsampleLinkedImages = false
  fxgSaveOptions.GradientsPolicy = 4 'AiGradientsPreservePolicy.aiAutomaticallyConvertGradients
	docRef.SaveAs destFile, fxgSaveOptions
End If
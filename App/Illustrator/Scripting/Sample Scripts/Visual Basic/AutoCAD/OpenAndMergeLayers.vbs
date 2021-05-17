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

' OpenAndMergeLayers.vbs

' DESCRIPTION

' Opens an AutoCAD DWG file and merges all layers.

' ************************************************************/

Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")


' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen file to open.
doJavaScript = "var fileRef = File.openDialog ('Select the AutoCAD (DWG) file to open:', '*.dwg', false); if(fileRef) filePath = fileRef.fsName;"
fileRef = appRef.DoJavaScript(doJavaScript)
If (fileSystemObject.FileExists(fileRef)) Then
	Set autoCADOpenOptions = appRef.Preferences.AutoCADFileOptions
	autoCADOpenOptions.MergeLayers = true
	currentInteractionLevel = appRef.UserInteractionLevel
	appRef.UserInteractionLevel = -1 ' aiDontDisplayAlerts
	appRef.Open fileRef, 2 ' aiCMYK
	appRef.UserInteractionLevel = currentInteractionLevel
End If
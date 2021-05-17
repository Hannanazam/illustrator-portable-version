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

' CollectForOutput.vbs

' DESCRIPTION

' This sample opens a document with placed items, copies the placed item files
' to a folder on the desktop, then relinks and saves the document to the same folder
' as the copied files.
' 
' *************************************************************

Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

' Find path to desktop
const DESKTOP = &H0&
set myShell = CreateObject("Shell.Application")
set myDesktopFolder = myShell.Namespace(DESKTOP)
set myDesktopFolderItem = myDesktopFolder.Self

' Create a reference to the output folder on the desktop
myOutputFolderPath = myDesktopFolderItem.Path & "\CollectForOutput"
If (not fileSystemObject.FolderExists(myOutputFolderPath)) Then
	fileSystemObject.CreateFolder(myOutputFolderPath)
End If

' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen sample file.

doJavaScript = "var sampleFile = File.openDialog(""Select Sample.ai file:""); if (sampleFile) filePath = sampleFile.fsName;"
sampleFilePath = appRef.DoJavaScript(doJavaScript)

If (fileSystemObject.FileExists(sampleFilePath)) Then
	' Open input doc
	appRef.Open(sampleFilePath)
	Set docRef = appRef.ActiveDocument
	inputFileName = docRef.Name

	'Loop thru placed items
	const READONLY = 1
	For i = 1 To docRef.PlacedItems.Count
		' copy linked file to output folder
		sourceFilePath = docRef.PlacedItems(i).File
		sourceFileName = fileSystemObject.GetFileName(sourceFilePath)
		targetFilePath = myOutputFolderPath & "\" & sourceFileName
		fileSystemObject.CopyFile sourceFilePath, targetFilePath, true
		' relink the placed item to the copied file in output folder
		docRef.PlacedItems(i).File = targetFilePath
		' Clear any read-only flag in the target file 
		' so we can run the script multiple times. 
		set f = fileSystemObject.GetFile(targetFilePath)
		if f.attributes and READONLY then
			f.attributes = f.attributes - READONLY
		end if

	Next

	'Save Illustrator doc to output directory
	myOutputFilePath = myOutputFolderPath & "\" & inputFileName
	docRef.SaveAs (myOutputFilePath)
	docRef.Close()

	myMsg = "alert(""Output collected in folder: " & myOutputFolderPath  & """)"
	myMsg = Replace( myMsg, "\", "\\" )
	appRef.DoJavaScript myMsg
End If

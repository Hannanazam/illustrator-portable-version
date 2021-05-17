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

' ExportAllExistingDatasets.vbs

' DESCRIPTION

' This sample exports all Datasets existing in the current 
' document and creates separate Illustrator files for each
' dataset.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

const DESKTOP = &H0&
set myShell = CreateObject("Shell.Application")
set myDesktopFolder = myShell.Namespace(DESKTOP)
set myDesktopFolderItem = myDesktopFolder.Self

If (appRef.Documents.Count > 0) Then
	Set docRef = appRef.Documents(1)
	'loop thru datasets
	If docRef.DataSets.Count > 0 Then
	
		' Create folder object for path and save the dataset files.
		Set fileSysRef = CreateObject( "Scripting.FileSystemObject" )
		Set desktopFolder = fileSysRef.GetFolder(myDesktopFolderItem.Path)
		If (fileSysRef.FolderExists(desktopFolder & "\ExportedDatasets")) Then
			Set folderRef = fileSysRef.GetFolder( desktopFolder & "\ExportedDatasets")
		Else
			Set folderRef = desktopFolder.Subfolders.Add("ExportedDatasets")
		End If
				
		For i = 1 To docRef.DataSets.Count
			myPath = folderRef & "\" & i & ".pdf"
			docRef.DataSets(i).Display
			docRef.SaveAs (myPath)
		Next
		appRef.DoJavaScript "alert('Exported all datasets to the ExportedDatasets folder on the desktop.')"
		
	Else 
		appRef.DoJavaScript "alert('No datasets in this document!')"
	End If
Else
	appRef.DoJavaScript "alert('No document open. Please open a document with datasets.')"
End If

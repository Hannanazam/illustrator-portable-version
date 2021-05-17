'*************************************************************
' 
' ADOBE SYSTEMS INCORPORATED 
' Copyright 2008-2010 Adobe Systems Incorporated 
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

' RemoveArtboards.vbs

' DESCRIPTION

' Removes an artboard from an existing document.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count > 0) Then
	Set docRef = appRef.ActiveDocument
	If (docRef.Artboards.Count > 1) Then
		' Remove last artboard
		docRef.Artboards.Remove(docRef.Artboards.Count - 1)
	Else
		appRef.DoJavaScript("alert('Cannot remove the only artboard in the document', 'Error removing artboard');")
	End If
Else
	appRef.DoJavaScript("alert('Open a document with more than 1 artboard before running this script', 'Error running RemoveArtboards.vbs');")
End If
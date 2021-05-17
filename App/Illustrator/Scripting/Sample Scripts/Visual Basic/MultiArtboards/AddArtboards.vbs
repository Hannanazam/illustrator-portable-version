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

' AddArtboards.vbs

' DESCRIPTION

' Add a new artboard to an existing document.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count > 0) Then
	Set docRef = appRef.ActiveDocument
	numArtboardsBefore = docRef.Artboards.Count
	docRef.Artboards.Add(Array(700,500,900,200))
	numArtboardsAfter = docRef.Artboards.Count
	If (numArtboardsAfter = (numArtboardsBefore +1)) Then
		appRef.DoJavaScript("alert('Correct number artboards', 'Result');")
	Else
		appRef.DoJavaScript("alert('Incorrect number artboards', 'Result');")
	End If
Else
	appRef.DoJavaScript("alert('Open a document before running this script', 'Error running AddArtboards.vbs');")
End If
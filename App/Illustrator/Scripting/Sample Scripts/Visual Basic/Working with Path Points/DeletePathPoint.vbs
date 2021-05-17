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

' DeletePathPoint.vbs

' DESCRIPTION

' This sample creates a path item object if it does not exist
' and then deletes a path point from the object.

'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count = 0) Then
	Set docRef = appRef.Documents.Add
Else
	Set docRef = appRef.ActiveDocument
End If

If (docRef.PathItems.Count = 0) Then
	Set pathArt = docRef.PathItems.Star(300, 425, 100, 50, 5)
Else
	Set pathArt = docRef.PathItems(1)
End If

appRef.redraw

appRef.DoJavaScript "alert('Path item object created.')"

' OR
' MsgBox "Path item object created."

Set points = pathArt.PathPoints

' Remove the second point
If (points.Count >= 2) Then
	points.Remove points(2)
	appRef.DoJavaScript "alert('Deleted point 2.')"
	' OR
	' MsgBox "Deleted point 2."
End If


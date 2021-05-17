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

' CountCorners.vbs

' DESCRIPTION

' This sample counts the corner points of the first path item
' in the active document or creates a new document and adds a 
' path item and counts the corner points.
'
'*************************************************************


Set appRef = CreateObject("Illustrator.Application")

' Check if a document is open or add a new one and set docRef 
' to the document
If (appRef.Documents.Count = 0) Then
	Set docRef = appRef.Documents.Add
Else
	Set docRef = appRef.ActiveDocument
End If

' Check if PathItems exist in the document or create one
If (docRef.PathItems.Count = 0) Then
	Set pathArt = docRef.PathItems.Star(300, 425, 100, 50, 5)
Else
	Set pathArt = docRef.PathItems(1)
End If

numberOfPathPoints = pathArt.PathPoints.Count
numberOfCorners = 0
For index = 1 To numberOfPathPoints
	If (pathArt.PathPoints(index).PointType = 2) Then
    		numberOfCorners = numberOfCorners + 1
	End If
Next

myMsg = "alert(""The first path has " & CStr(numberOfPathPoints) & " points. " & CStr(numberOfCorners) & " of these points are corner points."")"
appRef.DoJavaScript myMsg

' OR
' MsgBox "The first path has " + CStr(numberOfPathPoints) + " points. " + CStr(numberOfCorners) + " of these points are corner points."
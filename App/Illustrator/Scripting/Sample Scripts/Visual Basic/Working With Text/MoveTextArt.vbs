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

' MoveTextArt.vbs

' DESCRIPTION

' This example duplicates an art item from one document to another,
' moves the item to a specific index position in its layer.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count = 0) Then
	Set sourceDoc = appRef.Documents.Add
Else
	Set sourceDoc = appRef.ActiveDocument
End If
    
If (sourceDoc.PageItems.Count = 0) Then
	Set textArt = sourceDoc.TextFrames.Add
	textArt.Position = Array(100, 425)
	textArt.Contents = "Illustrator Scripting"
	textArt.TextRange.CharacterAttributes.Size = 48
Else
	Set textArt = sourceDoc.TextFrames(1)
End If
    
Set targetDoc = appRef.Documents.Add
Set targetLayer = targetDoc.Layers.Add
targetLayer.Name = "Target Layer"
    
Set dupRef = textArt.Duplicate(targetLayer)
    
dupRef.MoveToBeginning targetLayer
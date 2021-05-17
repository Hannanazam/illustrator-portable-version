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

' Align Text.vbs

' DESCRIPTION

' This example aligns all text art items on the active layer of the
' active document vertically with the x position of the topmost
' art item in the layer.
' 
'*************************************************************


Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count = 0) Then
	Set docRef = appRef.Documents.Add
Else
	Set docRef = appRef.ActiveDocument
End If
    
If (docRef.TextFrames.Count = 0) Then
	Set textArt = docRef.TextFrames.Add
	textArt.Position = Array(200, 450)
	textArt.Contents = "Scripting"
	textArt.TextRange.CharacterAttributes.Size = 32
	Set textArt = docRef.TextFrames.Add
	textArt.Position = Array(100, 650)
	textArt.Contents = "Illustrator"
	textArt.TextRange.CharacterAttributes.Size = 32
End If

topItemPosX = docRef.ActiveLayer.TextFrames(1).Left

For Each textArt In docRef.TextFrames
	textArt.Left = topItemPosX
Next
    
appRef.Redraw


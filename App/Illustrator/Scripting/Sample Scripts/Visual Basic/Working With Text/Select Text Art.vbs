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

' Select Text Art.vbs

' DESCRIPTION

' This example selects all text art that containt the text in the
' targetString variable. Change the search string in targetString
' if you want to search for a different string.
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
	textArt.Position = Array(100, 425)
	textArt.Contents = "Illustrator Scripting"
	textArt.TextRange.CharacterAttributes.Size = 48
End If
   
' NOTE: Change target string here if you want to search for
' a different string

targetString = "Scripting"

Rem Clear the old selection (if any)
docRef.Selection = Empty
    
Rem select all text art items that contains the target string
For Each textArt In docRef.TextFrames
	If (InStr(textArt.Contents, targetString) > 0) Then
		textArt.Selected = True
	End If
Next
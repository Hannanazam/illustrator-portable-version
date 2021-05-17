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

' Count Words.vbs

' DESCRIPTION

' This example counts the total words in any/all text frames in 
' the active document.
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
    
numberOfWords = 0
For Each textArt In docRef.TextFrames
	Set textArtRange = textArt.TextRange
	numberOfWords = numberOfWords + textArt.Words.Count
Next

myMsg = "alert(""There are " & CStr(numberOfWords) & " words in the document."")"
appRef.DoJavaScript myMsg

' OR
' MsgBox "There are " & numberOfWords & " words in the document."


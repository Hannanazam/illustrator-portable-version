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

' CreateDeleteTag.vbs

' DESCRIPTION

' This example shows how to create, initialize, and remove 
' an item Tag.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count = 0) Then
	Set docRef = appRef.Documents.Add
Else
	Set docRef = appRef.ActiveDocument
End If

If (docRef.PageItems.Count = 0) Then
	Set textArt = docRef.TextFrames.Add
	textArt.Position = Array(100, 425)
	textArt.Contents = "Illustrator Scripting"
	textArt.TextRange.CharacterAttributes.Size = 48
End If

appRef.DoJavaScript "alert('Adding a tag')"
' OR
' MsgBox "Adding a tag."

Set newTag = docRef.PageItems(1).Tags.Add
newTag.Name = "MyTest"
newTag.Value = "MyValue"

Rem now delete the tag.
Rem Obtain the tag using it's name
appRef.DoJavaScript "alert('Removing the tag.')"
' OR
' MsgBox "Removing the tag."

Set tagToDelete = docRef.PageItems(1).Tags("MyTest")
docRef.PageItems(1).Tags.Remove tagToDelete

appRef.DoJavaScript "alert('Tag deleted.')"
' OR
' MsgBox "Tag deleted"
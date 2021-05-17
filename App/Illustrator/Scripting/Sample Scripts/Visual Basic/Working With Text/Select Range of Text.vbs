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

' Select Range of Text.vbs

' DESCRIPTION

' This example creates a text item with 3 lines and selects 
' the 2nd line.
' 
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")
    
Set docRef = appRef.Documents.Add
    
Set textRef = docRef.TextFrames.Add
textRef.Position = Array(100, 600)
textRef.Contents = "Line 1" & vbCrLf & "Line 2 (selected)" & vbCrLf & "Line 3"
textRef.TextRange.CharacterAttributes.Size = 40
    
textRef.Lines(2).Select
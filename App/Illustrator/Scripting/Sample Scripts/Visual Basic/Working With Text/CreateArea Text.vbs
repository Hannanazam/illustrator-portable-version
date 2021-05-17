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

' CreateArea Text.vbs

' DESCRIPTION

' This sample creates a new document and adds 3 text items.
' 
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add
    
Set itemRef_1 = docRef.PathItems.Rectangle(700, 100, 100, 30)
Set textRef_1 = docRef.TextFrames.AreaText(itemRef_1)
textRef_1.Selected = True
    
Set itemRef_2 = docRef.PathItems.Rectangle(500, 200, 100, 30)
Set textRef_2 = docRef.TextFrames.AreaText(itemRef_2, aiHorizontal, textRef_1)
textRef_2.Selected = True
    
Set itemRef_3 = docRef.PathItems.Rectangle(300, 300, 100, 30)
Set textRef_3 = docRef.TextFrames.AreaText(itemRef_3, aiHorizontal, textRef_2)
textRef_3.Selected = True
    
sText = "This is three text frames linked together as one story, with text flowing from the first to the last"
textRef_1.Contents = sText
appRef.Redraw
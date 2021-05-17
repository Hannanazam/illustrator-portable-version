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

' AppInfo.vbs

' DESCRIPTION

' Displays the application build number and locale in a new  text frame.

'*************************************************************


Set appRef = CreateObject("Illustrator.Application")
Set docRef = appRef.Documents.Add(2) ' aiDocumentCMYKColor

' Create a new text frame in the new document
Set textRef = docRef.TextFrames.Add
textRef.Top = 100
textRef.Left = 200

textRef.Contents = "Application build number: " + appRef.BuildNumber + ", application locale: " + appRef.Locale